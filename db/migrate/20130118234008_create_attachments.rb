class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name
      t.integer :file_uid
      t.string  :file_name
      t.string  :path
      t.string  :file

      t.timestamps
    end
  end
end
