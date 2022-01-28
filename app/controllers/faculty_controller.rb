class FacultyController < ApplicationController
  before_action :current_faculty, only: [:show, :edit, :update, :destroy]

  def index
    @faculties = Faculty.all
  end

  def show
  end

  def new
    @faculty = Faculty.new
  end

  def create
    a = Faculty.create(faculty_params)

    redirect_to faculty_index_path
  end

  def edit
  end

  def update
    @faculty.update(faculty_params)

    redirect_to faculty_index_path
  end

  def destroy
    @faculty.destroy

    redirect_to faculty_index_path
  end

  private

  def faculty_params
    params.require(:faculty).permit(:first_name, :last_name, :phone_number, :email, :birth_date, :designation)
  end

  def current_faculty
    @faculty = Faculty.find(params[:id])
  end
end
