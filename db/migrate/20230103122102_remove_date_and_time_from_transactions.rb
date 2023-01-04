class RemoveDateAndTimeFromTransactions < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :date, :string
    remove_column :transactions, :time, :string
  end
end
