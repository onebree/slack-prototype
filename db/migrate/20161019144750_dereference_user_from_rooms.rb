class DereferenceUserFromRooms < ActiveRecord::Migration[5.0]
  def change
    remove_reference :rooms, :user, :index => true, :foreign_key => true
  end
end
