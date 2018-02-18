class RenameActiverFromRoomToActive < ActiveRecord::Migration[5.2]
  def change
    rename_column :rooms, :activer, :active
  end
end
