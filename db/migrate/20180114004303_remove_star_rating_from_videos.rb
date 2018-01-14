class RemoveStarRatingFromVideos < ActiveRecord::Migration[5.1]
  def change
    remove_column :videos, :star_rating, :integer
  end
end
