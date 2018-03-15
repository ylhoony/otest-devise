class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :company_address_id
      t.integer :warehouse_id
      t.integer :account_id
      t.integer :account_address_id
      t.string :type
      t.string :order_ref_number
      t.text :comment

      t.timestamps null: false
    end
  end
end
