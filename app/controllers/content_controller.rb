class ContentController < ApplicationController
  # override these methods when inheriting:
  # models_path (eg projects_path), model_tags (eg project_tags), model_klaas (eg Project)
  
  #make sure you set your before_filters, eg:
  #before_filter :require_user, except: [:index, :show, :tags, :tag]
  
  include TagsHelper
  
  def index
    @objs = model_klaas.all
    @tags = model_tags(12)
    respond_to do |format| 
      format.html
      format.json {render json: @objs, only: [:id, :title]}
      format.xml {render xml: @objs, only: [:id, :title]}
    end
  end
  
  def my
    if model_klaas == Project
      @objs = current_user.projects
    elsif
      @objs = current_user.offered_services
    else
      @objs = []
    end
    @tags = @objs.flat_map(&:tags).uniq # what about @objs.tag_counts_on(:tags) ?
    render "index"
  end

  def tags
    @tags = model_klaas.all_tag_counts.order("tags.name asc").limit(1000)
    @cloud_tags = model_tags(30).shuffle
  end
  
  def tag
    @tags = model_tags(12)
    if params[:tag]
      @objs = model_klaas.tagged_with(params[:tag])
      render "index"
    else
      redirect_to models_path
    end
  end
  
  def starred
    @objs = current_user.starred
    @tags = @objs.flat_map(&:tags).uniq
    render "index"
  end
  
  def star
    current_user.star_project(@obj)
    respond_to do |format| 
      format.html { redirect_to @obj }
      format.js
    end
  end
  
  def unstar
    current_user.unstar_project(@obj)
    respond_to do |format| 
      format.html { redirect_to @obj }
      format.js
    end
  end
  
  def new
    @obj = model_klaas.new
    if @obj.respond_to?("contact=")
      @obj.contact = current_user.name
      @obj.contact = "#{@obj.contact} (#{current_user.orga_unit})" if current_user.orga_unit
    end
  end

  def edit
    find_model
    redirect_to @obj unless @obj.user == current_user
  end

  def show
    find_model
    respond_to do |format| 
      format.html
      format.json {render json: @obj, only: [:id, :title, :rendered_description, :contact, :link]}
      format.xml {render xml: @obj, only: [:id, :title, :rendered_description, :contact, :link]}
    end
  end
  
  def create
    @obj = model_klaas.new model_params
    @obj.user = current_user
    if @obj.save
      redirect_to @obj, notice: t("notice.saved")
    else
      render "new"
    end
  end
  
  def update
    find_model
    if @obj.user == current_user && @obj.update_attributes(model_params)
      redirect_to @obj, notice: t("notice.saved")
    else
      render "edit", notice: t("notice.not_saved")
    end
  end
  
  def destroy
    find_model
    if @obj.user == current_user && @obj.destroy 
      redirect_to models_path, notice: t("notice.deleted")
    else
      redirect_to @obj, notice: t("notice.not_deleted")
    end
  end
  
  protected
  def find_model
    @obj = model_klaas.find(params[:id])
  end
  
end