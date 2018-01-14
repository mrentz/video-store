class AddReleaseDateToVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :release_date, :string
  end
end
