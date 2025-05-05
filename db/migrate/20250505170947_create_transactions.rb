class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.string :raw_message

      t.timestamps
    end
  end
end
