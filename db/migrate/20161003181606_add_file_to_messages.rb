class AddFileToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :file_id, :string
    add_column :messages, :file_filename, :string
    add_column :messages, :file_size, :string
    add_column :messages, :file_content_type, :string
  end
end
