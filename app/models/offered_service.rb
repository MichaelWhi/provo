class OfferedService < ActiveRecord::Base
  include MarkdownHelper
  
  acts_as_taggable
    
  has_many :attachments
  
  belongs_to :user
  belongs_to :project
  
  validates :title, :description, :contact, presence: true
  
  before_save :render_description
  before_validation :smart_add_link_protocol
end
