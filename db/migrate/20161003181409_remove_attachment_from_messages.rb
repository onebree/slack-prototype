class RemoveAttachmentFromMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :attachment, :string
  end
end
