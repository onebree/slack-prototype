class AddFileToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :file_id, :string
    add_column :documents, :file_filename, :string
    add_column :documents, :file_size, :string
    add_column :documents, :file_content_type, :string
  end
end
