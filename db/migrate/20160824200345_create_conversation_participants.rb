class CreateConversationParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :conversation_participants do |t|
      t.references :conversation, :index => true
      t.references :participant, :index => true

      t.timestamps
    end
  end
end
