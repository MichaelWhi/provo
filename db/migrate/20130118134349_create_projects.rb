class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :link
      t.text :description
      t.string :contact

      t.timestamps
    end
  end
end
