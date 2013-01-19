class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def show
    @project = Project.find(params[:id])
  end
  
  def create
    @project = Project.new project_params
    if @project.save
      redirect_to @project, notice: t("notice.saved")
    else
      render "new"
    end
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to @project, notice: t("notice.saved")
    else
      render "edit"
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    if @project.destroy 
      redirect_to projects_path, notice: t("notice.deleted")
    else
      redirect_to @project
    end
  end
  
  def starred
    @projects = Project.all
    render "index"
  end
  
  protected
  def project_params
    params.require(:project).permit(:title, :contact, :description, :link, :tags)
  end
end
