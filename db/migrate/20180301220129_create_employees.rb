class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.integer :user_id
      t.integer :company_id
      t.string :job_title
      t.integer :employee_role_id
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
