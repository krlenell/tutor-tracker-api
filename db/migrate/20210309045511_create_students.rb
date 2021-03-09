class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students, id: :uuid do |t|
      t.text :student_name, null:false
      t.boolean :is_active, default: false
      t.boolean :is_minor, null: false
      t.integer :student_phone
      t.text :student_email
      t.text :school
      t.text :address

      t.timestamps
    end
  end
end
