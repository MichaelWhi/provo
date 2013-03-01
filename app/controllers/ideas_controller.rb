class IdeasController < ContentController
  include TagsHelper
  before_filter :require_user, except: [:index, :show, :tags, :tag, :comment]

  def edit
    find_model
    @idea = @obj
    redirect_to @idea unless @idea.user == current_user
    redirect_to @idea, alert: "You cannot edit the idea in the current state. You might want to fork it and alter its description." unless idea_can_be_edited?(@idea)
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
  
  def comment
    find_model
    if !params[:comment][:comment].blank? && @obj.comments.create(user_id: user_or_guest.id, comment: params[:comment][:comment])
      # ok
    else
      head :unprocessable_entity
    end
  end
  
  
  protected
  def models_path
    ideas_path
  end
  
  def model_tags(arg)
    idea_tags(arg)
  end
  
  def model_klaas
    Idea
  end
  
  def idea_can_be_edited?(idea)
    idea.new? || idea.awaiting_review?
  end
  
  def model_params
    params.require(:idea).permit(:title, :description, :link, :tag_list)
  end
end
