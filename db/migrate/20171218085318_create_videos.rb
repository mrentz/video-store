class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :description
      t.string :content_rating
      t.integer :user_rating
      t.integer :rating
      t.integer :star_rating
      t.string :actors
      t.date :release_date
      t.string :thumbnail

      t.timestamps
    end
  end
end
