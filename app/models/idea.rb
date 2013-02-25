class Idea < ActiveRecord::Base
  include MarkdownHelper
  
  acts_as_taggable
  acts_as_votable
  acts_as_commentable :public, :private

  belongs_to :user
  
  validates :title, :description, presence: true
  
  include Workflow
  workflow do
    state :new do
      event :submit, :transitions_to => :awaiting_review
    end
    state :awaiting_review do
      event :review, :transitions_to => :being_reviewed
    end
    state :being_reviewed do
      event :accept, :transitions_to => :accepted
      event :reject, :transitions_to => :rejected
      event :postpone, :transitions_to => :postponed
    end
    state :accepted
    state :rejected
    state :postponed
  end
  
  before_save :render_description
  before_validation :smart_add_link_protocol
  
end
