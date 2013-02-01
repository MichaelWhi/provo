class Project < ActiveRecord::Base
  acts_as_taggable
    
  before_save :render_description
  
  has_many :attachments
  
  belongs_to :user
  
  validates :title, :description, :contact, presence: true
  before_validation :smart_add_link_protocol
  
  private
    def render_description
      self.rendered_description = MARKDOWN_HTML.render self.description
    end
    
    def smart_add_link_protocol
      unless self.link[/^http:\/\//] || self.link[/^https:\/\//]
        self.link = 'http://' + self.link
      end
    end
end
