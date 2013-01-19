require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "a created project can be found" do
    @project = Project.new
    @project.title = "Project title"
    @project.description = "Test description"    
    @project.contact = "test contact"
    @project.save!
    assert_equal @project, Project.where(title: "Project title").first
  end
  
  test "a project without title cannot be saved" do
    @project = Project.new
    @project.description = "Test description"
    assert_not @project.valid?
  end
end
