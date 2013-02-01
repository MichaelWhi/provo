class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, nil: false
      t.string :email, nil: false
      t.string :crypted_password, nil: false
      t.datetime :last_login_at
      t.string :salt
      t.string :persistence_token

      t.timestamps
    end
  end
end
