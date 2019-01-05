class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.datetime :scheduled_date_time
      t.integer :sender_number
      t.integer :receiver_number
      t.string :content
      t.datetime :sent_date_time

      t.timestamps
    end
    add_index :messages, :scheduled_date_time, :sent_date_time
  end
end
