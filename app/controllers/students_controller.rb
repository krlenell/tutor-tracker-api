# Controller for Students
class StudentsController < ApplicationController
  def index
    render json: {hello: "Hello"}
  end
end
