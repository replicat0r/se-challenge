class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :date
      t.string :category
      t.string :employee_name
      t.string :employee_address
      t.string :expense_description
      t.string :pre_tax_amount
      t.string :tax_name
      t.string :tax_amount

      t.timestamps null: false
    end
  end
end
