# Controller for Students
class StudentsController < ApplicationController
  def index
    student_list = Student.all
    render json: student_list, status: :ok
  end
end
