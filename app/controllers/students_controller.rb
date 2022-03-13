class StudentsController < ApplicationController
  before_action :get_school, only: %i[create new index]
  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    @students = @school.students
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student =  @school.students.build
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    unless signed_in?
      redirect_to new_user_session_path
    else
      authorize Student
        @student = @school.students.build(student_params)

        respond_to do |format|
          if @student.save
            format.html { redirect_to school_students_path(@school), notice: "Student was successfully created." }
            format.json { render :show, status: :created, location: @student }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @student.errors, status: :unprocessable_entity }
          end
        end
      end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    authorize Student
      respond_to do |format|
        if @student.update(student_params)
          format.html { redirect_to student_path(@student), notice: "Student was successfully updated." }
          format.json { render :show, status: :ok, location: @student }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy
    authorize Student

    respond_to do |format|
      format.html { redirect_to school_students_path(@student.school_id), notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def get_school
      @school = School.find(params[:school_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:lastname, :firstname, :middlename, :dob, :street, :city, :zip, :pronouns, :gender, :school_id, :user_id, lesson_ids: [])
    end
end
