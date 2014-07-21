class CreateUser < ActiveRecord::Migration
  def up
    create_table :user do |t|
      t.string :username
      t.string :password
    end
  end

  def down
    drop_table :users
  end
end
