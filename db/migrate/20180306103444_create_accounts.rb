class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :company_id
      t.string :type
      t.string :account_name
      t.text :comment
      t.integer :payment_term_id
      t.integer :currency_id

      t.timestamps
    end
  end
end
