class User < ActiveRecord::Base
  has_many :projects
  
  validates :name, :email, presence: true
  
  store :meta, accessors: [ :starred_projects ]
  
  acts_as_authentic
  
  def starred
    unless self.starred_projects.nil?
      self.starred_projects.map do |pid|
        Project.find(pid.to_i)
      end
    else
      []
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
    self.starred_projects.include?(thing)
  end
  
end