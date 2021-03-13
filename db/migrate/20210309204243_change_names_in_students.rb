# changed column names to remove excess junk
class ChangeNamesInStudents < ActiveRecord::Migration[6.1]
  def change
    rename_column :students, :student_name, :name
    rename_column :students, :is_active, :active
    rename_column :students, :is_minor, :minor
    rename_column :students, :student_phone, :phone
    rename_column :students, :student_email, :email
  end
end
