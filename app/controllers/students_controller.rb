# Controller for Students
class StudentsController < ApplicationController
  def index
    student_list = Student.all
    if student_list.length.zero?
      render json: {error: 'no students'}, status: :not_found
    else
      render json: student_list, status: :ok
    end
  end
end
