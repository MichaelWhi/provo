class IdeasController < ApplicationController
  include TagsHelper
  before_filter :require_user, except: [:index, :show, :tags, :tag]
  
  def index
    @ideas = Idea.all
    @tags = project_tags(12)
    respond_to do |format| 
      format.html
      format.json {render json: @ideas, only: [:id, :title]}
      format.xml {render xml: @ideas, only: [:id, :title]}
    end
  end
  
  def my
    @ideas = current_user.ideas
    @tags = @ideas.flat_map(&:tags).uniq # what about @tags.tag_counts_on(:tags) ?
    render "index"
  end

  def new
    @idea = Idea.new
  end

  def edit
    find_idea
    redirect_to @idea unless @idea.user == current_user
    redirect_to @idea, alert: "You cannot edit the idea in the current state. You might want to fork it and alter its description." unless idea_can_be_edited?(@idea)
  end

  def show
    find_idea
    respond_to do |format| 
      format.html
      format.json {render json: @idea, only: [:id, :title, :rendered_description, :contact, :link]}
      format.xml {render xml: @idea, only: [:id, :title, :rendered_description, :contact, :link]}
    end
  end
  
  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    if @idea.save
      redirect_to @idea, notice: t("notice.saved")
    else
      render "new"
    end
  end
  
  def update
    find_idea
    if @idea.user == current_user && @idea.update_attributes(idea_params)
      redirect_to @idea, notice: t("notice.saved")
    else
      render "edit", notice: t("notice.not_saved")
    end
  end
  
  def tags
    @tags = Idea.all_tag_counts.order("tags.name asc").limit(1000)
    @cloud_tags = idea_tags(30).shuffle
  end
  
  def tag
    @tags = idea_tags(12)
    if params[:tag]
      @ideas = Idea.tagged_with(params[:tag])
      render "index"
    else
      redirect_to ideas_path
    end
  end
  
  def vote
    find_idea
    
    case params[:kind]
    when "like" then @idea.liked_by current_user
    when "unlike" then @idea.unliked_by current_user
    when "dislike" then @idea.disliked_by current_user
    when "undislike" then @idea.undisliked_by current_user
    end
    
    head :ok
  end
  
  def user_vote_status
    find_idea
    if current_user.voted_up_on? @idea
      render text: "up"
    elsif current_user.voted_down_on? @idea
      render text: "down"      
    else
      render text: ""
    end
  end
  
  def destroy
    find_idea
    if @idea.user == current_user && @idea.destroy 
      redirect_to ideas_path, notice: t("notice.deleted")
    else
      redirect_to @idea, notice: t("notice.not_deleted")
    end
  end
  
  def comment
    find_idea
    if !params[:comment][:comment].blank? && @idea.comments.create(comment: current_user.name + ": " + params[:comment][:comment])
      # ok
    else
      head :unprocessable_entity
    end
  end
  
  protected
  def find_idea
    @idea = Idea.find(params[:id])
  end
  
  def idea_can_be_edited?(idea)
    idea.new? || idea.awaiting_review?
  end
  
  def idea_params
    params.require(:idea).permit(:title, :description, :link, :tag_list)
  end
end
