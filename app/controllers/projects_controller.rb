class ProjectsController < ContentController
  before_filter :require_user, except: [:index, :show, :tags, :tag, :embed, :qr]
  
  def qr
    @project = Project.find(params[:id])
    redirect_to "https://chart.googleapis.com/chart?cht=qr&choe=ISO-8859-1&chs=200x200&chl=#{project_url(@project)}"
  end
  
  def embed
    @projects = User.find(params[:id]).projects
#    @projects = Project.where(user_id: params[:id])
  end

  protected
  def models_path
    projects_path
  end
  
  def model_tags(arg)
    project_tags(arg)
  end
  
  def model_klaas
    Project
  end
  
  def model_params
    params.require(:project).permit(:title, :contact, :description, :link, :tag_list)
  end
end
