class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :description
      t.string :workflow_state
      t.integer :user_id

      t.timestamps
    end
  end
end
