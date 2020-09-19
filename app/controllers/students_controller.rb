class StudentsController < ApplicationController

  before_action :student_find, only: [:show, :edit, :update]

  def index
    @students = Student.all
  end

  def show 
    # @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    student = Student.create(student_params)

    if student.valid?
      redirect_to student_path(student)
    else
      flash[:errors] = student.errors.full_messages
      redirect_to new_student_path
    end
     
  end

  def edit
    # @student = Student.find(params[:id])
    
  end

  def update

    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to edit_student_path
    end

  end





  private

  def student_params
    params.require(:student).permit!
  end

  def student_find
    @student = Student.find(params[:id])
  end

end
