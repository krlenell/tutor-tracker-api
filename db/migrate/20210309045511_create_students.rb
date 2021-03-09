class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students, id: :uuid do |t|
      t.primary_key :student_id
      t.text :student_name
      t.boolean :is_active
      t.boolean :is_minor
      t.integer :student_phone
      t.text :student_email
      t.text :school
      t.text :address

      t.timestamps
    end
  end
end
