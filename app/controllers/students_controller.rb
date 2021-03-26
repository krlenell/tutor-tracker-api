# Controller for Students
class StudentsController < ApplicationController
  def index
    student_list = Student.all
    render json: student_list, status: :ok
  end

  def show
    if Student.exists?(id: params[:id])
      student = Student.find_by(id: params[:id])
      render json: student, status: :ok
    else
      render json: { error: 'student not found' }, status: :not_found
    end
  end
end
