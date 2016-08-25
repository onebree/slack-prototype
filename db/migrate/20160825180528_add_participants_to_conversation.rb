class AddParticipantsToConversation < ActiveRecord::Migration[5.0]
  def change
    drop_table :conversation_participants do |t|
      t.references :conversation, :index => true
      t.references :participant, :index => true

      t.timestamps
    end

    add_column :conversations, :participant_one_id, :integer
    add_column :conversations, :participant_two_id, :integer
  end
end
