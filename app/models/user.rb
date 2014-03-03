class User < ActiveRecord::Base
  acts_as_voter
  
  has_many :projects
  has_many :ideas
  has_many :offered_services
  
  validates :name, :email, presence: true
  
  store :meta, accessors: [ :starred_projects ]
  
  acts_as_authentic
  
  def starred
    if self.starred_projects.nil?
      []
    else
      Project.where(id: self.starred_projects.map(&:to_i))
    end
  end
  
  def star_project(project)
    thing = (project.is_a?(Project) ? project.id : project.to_i)
    unless self.starred_projects.nil?
      self.starred_projects << thing unless self.starred_projects.include?(thing)
    else
      self.starred_projects = []
    end
    self.save
  end
  
  def unstar_project(project)
    thing = (project.is_a?(Project) ? project.id : project.to_i)
    unless self.starred_projects.nil?
      self.starred_projects.delete thing
    else
      self.starred_projects = [thing]
    end
    self.save
  end
  
  def starred?(project)
    thing = (project.is_a?(Project) ? project.id : project.to_i)
    self.starred_ids.include?(thing)
  end
  
  
  protected
  def starred_ids
    self.starred_projects || []
  end
end