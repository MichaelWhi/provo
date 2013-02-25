class AddLinkToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :link, :string
  end
end
