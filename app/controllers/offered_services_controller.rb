class OfferedServicesController < ContentController
  before_filter :require_user, except: [:index, :show, :tags, :tag]

  protected
  def models_path
    offered_services_path
  end
  
  def model_tags(arg)
    offered_services_tags(arg)
  end
  
  def model_klaas
    OfferedService
  end
  
  def model_params
    params.require(:offered_service).permit(:title, :contact, :description, :link, :tag_list)
  end
end
