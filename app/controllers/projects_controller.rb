class ProjectsController < ApplicationController
  before_filter :require_user, except: [:embed, :qr, :index, :show]
  
  def index
    @projects = Project.all
    respond_to do |format| 
      format.html
      format.json {render json: @projects, only: [:id, :title]}
      format.xml {render xml: @projects, only: [:id, :title]}
    end
  end
  
  def my
    @projects = current_user.projects
    render "index"
  end
  
  def starred
    @projects = current_user.starred
    render "index"
  end
  
  def star
    @project = Project.find(params[:id])
    current_user.star_project(@project)
    respond_to do |format| 
      format.html { redirect_to @project }
      format.js
    end
  end
  
  def unstar
    @project = Project.find(params[:id])
    current_user.unstar_project(@project)
    respond_to do |format| 
      format.html { redirect_to @project }
      format.js
    end
  end
  
  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
    redirect_to @project unless @project.user == current_user
  end

  def show
    @project = Project.find(params[:id])
    respond_to do |format| 
      format.html
      format.json {render json: @project, only: [:id, :title, :rendered_description, :contact, :link]}
      format.xml {render xml: @project, only: [:id, :title, :rendered_description, :contact, :link]}
    end
  end
  
  def qr
    @project = Project.find(params[:id])
    redirect_to "https://chart.googleapis.com/chart?cht=qr&choe=ISO-8859-1&chs=200x200&chl=#{project_url(@project)}"
  end
  
  def create
    @project = Project.new project_params
    @project.user = current_user
    if @project.save
      redirect_to @project, notice: t("notice.saved")
    else
      render "new"
    end
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.user == current_user && @project.update_attributes(project_params)
      redirect_to @project, notice: t("notice.saved")
    else
      render "edit", notice: t("notice.not_saved")
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    if @project.user == current_user && @project.destroy 
      redirect_to projects_path, notice: t("notice.deleted")
    else
      redirect_to @project, notice: t("notice.not_deleted")
    end
  end
  
  def embed
    @projects = User.find(params[:id]).projects
#    @projects = Project.where(user_id: params[:id])
  end
  
  protected
  def project_params
    params.require(:project).permit(:title, :contact, :description, :link, :tag_list)
  end
end
