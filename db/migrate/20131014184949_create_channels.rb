class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :url
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
