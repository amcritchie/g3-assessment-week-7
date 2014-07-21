class CreateMessage < ActiveRecord::Migration
  def up
    create_table :user do |t|
      t.string :message
      t.string :username
    end
  end

  def down
    drop_table :messages
  end
end
