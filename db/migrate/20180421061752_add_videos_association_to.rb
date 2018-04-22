class AddVideosAssociationTo < ActiveRecord::Migration[5.1]
  def change
    add_reference :videos, :user, index: true
  end
end
