class CreateAttendance < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.belongs_to :employee
      t.date :work_date
      t.timestamp :check_in
      t.timestamp :check_out
      t.timestamps
      t.index([:employee_id, :work_date], unique: true)
    end
  end
end
