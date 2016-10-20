class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.references :user, foreign_key: true
      t.string :name

      t.timestamps
    end

    change_table :messages do |t|
      t.references :room, foreign_key: true
    end
  end
end
