class Project < ActiveRecord::Base
  acts_as_taggable
  before_save :render_description
  
  has_many :attachments
  
  validates :title, :description, :contact, presence: true
  
  private
    def render_description
      self.rendered_description = MARKDOWN_HTML.render self.description
    end
end
