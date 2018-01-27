class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
      rename_column :videos, :genre, :theme
  end
end
