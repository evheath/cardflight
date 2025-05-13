class AddAuthCodeToTransactions < ActiveRecord::Migration[8.0]
  def change
    add_column :transactions, :auth_code, :string
  end
end
