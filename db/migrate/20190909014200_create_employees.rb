class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.date :date_of_birth
      t.date :employment_date
      t.timestamps
    end
  end
end
