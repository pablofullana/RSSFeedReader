class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :link
      t.text :description
      t.date :pub_date
      t.text :comments
      t.boolean :starred
      t.integer :channel_id

      t.timestamps
    end
  end
end
