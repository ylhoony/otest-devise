class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :currency_id
      t.integer :company_status_id
      t.integer :pricing_plan_id

      t.timestamps null: false
    end
  end
end
