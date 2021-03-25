# Controller for Students
class StudentsController < ApplicationController
  def index
    student_list = Student.all
    render json: student_list, status: :ok
  end

  def show
    student = Student.find(params[:id])
    if student
      render json: student, status: :ok
    else
      render json: { error: 'student not found' }, status: :not_found
    end
  end
end
