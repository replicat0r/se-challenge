class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.date :date
      t.string :category
      t.string :employee_name
      t.string :employee_address
      t.string :expense_description
      t.decimal :pre_tax_amount, precision: 8, scale: 2
      t.string :tax_name
      t.decimal :tax_amount ,precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
