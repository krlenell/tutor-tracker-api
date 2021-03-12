class ChangeStudentsColumnValues < ActiveRecord::Migration[6.1]
  def change
    change_column :students, :name, :string
    change_column :students, :phone, :string
    change_column :students, :email, :string
    change_column :students, :school, :string
    change_column :students, :address, :string
    change_column :students, :active, :boolean, default:false, null:false
  end
end
