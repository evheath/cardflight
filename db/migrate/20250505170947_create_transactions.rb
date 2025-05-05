class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions, id: false do |t|
      t.string :transaction_id, null: false, primary_key: true
      t.string :raw_message, null: false

      t.timestamps
    end
    add_index :transactions, :transaction_id, unique: true
  end
end
