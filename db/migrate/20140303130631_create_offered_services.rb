class CreateOfferedServices < ActiveRecord::Migration
  def change
    create_table :offered_services do |t|
      t.string :title
      t.string :link
      t.text :description
      t.text :rendered_description
      t.string :contact
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
