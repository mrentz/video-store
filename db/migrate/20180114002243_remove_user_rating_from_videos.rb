class RemoveUserRatingFromVideos < ActiveRecord::Migration[5.1]
  def change
    remove_column :videos, :user_rating, :integer
  end
end
