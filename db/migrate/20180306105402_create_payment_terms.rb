class CreatePaymentTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_terms do |t|
      t.string :name
      t.decimal :trade_credit_percent, precision: 30, scale: 2
      t.integer :trade_credit_days
      t.integer :net_days
      t.integer :payment_option_id
      t.boolean :active

      t.timestamps
    end
  end
end
