class AddStarsToVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :stars, :string
  end
end
