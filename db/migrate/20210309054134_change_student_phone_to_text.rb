# changed phone from int to text
class ChangeStudentPhoneToText < ActiveRecord::Migration[6.1]
  def change
    change_column(:students, :student_phone, :text)
  end
end
