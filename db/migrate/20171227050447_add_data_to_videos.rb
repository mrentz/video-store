class AddDataToVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :genre, :text
  end
end
