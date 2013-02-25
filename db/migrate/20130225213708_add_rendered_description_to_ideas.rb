class AddRenderedDescriptionToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :rendered_description, :text
  end
end
