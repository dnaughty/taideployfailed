class TeachersController < ApplicationController
  before_action :get_school, only: %i[create new index]
  before_action :set_teacher, only: %i[ show edit update destroy ]

  # GET /teachers or /teachers.json
  def index
    @teachers = @school.teachers
  end

  # GET /teachers/1 or /teachers/1.json
  def show
  end


  # GET /teachers/new
  def new
    @teacher = @school.teachers.build
    authorize @teacher
  end


  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers or /teachers.json
  def create
    unless signed_in?
      redirect_to new_user_session_path
    else
      authorize Teacher
    @teacher = @school.teachers.build(teacher_params)

      respond_to do |format|
        if @teacher.save
          format.html { redirect_to school_teachers_path(@school), notice: "Teacher was successfully created." }
          format.json { render :show, status: :created, location: @teacher }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @teacher.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /teachers/1 or /teachers/1.json
  def update
    unless signed_in?
      redirect_to new_user_session_path
    else
      authorize Teacher

    respond_to do |format|
        if @teacher.update(teacher_params)
          format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully updated." }
          format.json { render :show, status: :ok, location: @teacher }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @teacher.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /teachers/1 or /teachers/1.json
  def destroy
    authorize Teacher
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to teachers_url, notice: "Teacher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_school
      @school = School.find(params[:school_id])
    end


    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_params
      params.require(:teacher).permit(:firstn, :lastn, :teachnum, :school_id, lesson_ids: [])
    end
end
