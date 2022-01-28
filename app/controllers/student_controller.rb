class StudentController < ApplicationController
  before_action :current_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
    a = Student.create(student_params)

    redirect_to student_index_path
  end

  def edit
  end

  def update
    @student.update(student_params)

    redirect_to student_index_path
  end

  def destroy
    @student.destroy

    redirect_to student_index_path
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :birth_date, :department, :terms_of_service)
  end

  def current_student
    @student = Student.find(params[:id])
  end
end
