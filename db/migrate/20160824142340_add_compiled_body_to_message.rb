class AddCompiledBodyToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :compiled_body, :text
  end
end
