class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    respond_to do |format| 
      format.html
      format.json {render json: @projects, only: [:id, :title]}
      format.xml {render xml: @projects, only: [:id, :title]}
    end
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
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
    params.require(:project).permit(:title, :contact, :description, :link, :tag_list)
  end
end
