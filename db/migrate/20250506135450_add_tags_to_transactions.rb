class AddTagsToTransactions < ActiveRecord::Migration[8.0]
  def change
    add_column :transactions, :merchant, :string
    add_column :transactions, :network, :string
    add_column :transactions, :amount, :integer
    add_column :transactions, :transaction_descriptor, :string
  end
end
