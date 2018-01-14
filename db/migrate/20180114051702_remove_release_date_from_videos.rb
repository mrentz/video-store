class RemoveReleaseDateFromVideos < ActiveRecord::Migration[5.1]
  def change
    remove_column :videos, :release_date, :date
  end
end
