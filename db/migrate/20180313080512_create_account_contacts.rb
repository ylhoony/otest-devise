class CreateAccountContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :account_contacts do |t|
      t.references :account, polymorphic: true, index: true
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :email
      t.string :phone
      t.string :mobile
      t.string :fax
      t.text :comment
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
