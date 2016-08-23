class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :sender, index: true
      t.references :receivable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
