class RemoveFileFromMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :file_id, :string
    remove_column :messages, :file_filename, :string
    remove_column :messages, :file_size, :string
    remove_column :messages, :file_content_type, :string
  end
end
