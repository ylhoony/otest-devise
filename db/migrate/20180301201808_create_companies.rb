class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :currency_id
      t.integer :country_id
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
