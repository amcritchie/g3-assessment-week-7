class CreateMessage < ActiveRecord::Migration
  def up
    create_table :message_table do |t|
      t.string :message
      t.string :name
    end
  end

  def down
    drop_table :message_table
  end
end
