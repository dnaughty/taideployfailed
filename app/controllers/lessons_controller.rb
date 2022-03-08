class LessonsController < ApplicationController
  before_action :get_school, only: %i[create new index]
  before_action :set_lesson, only: %i[ show edit update destroy ]

  # GET /lessons or /lessons.json
  def index
    @lessons = @school.lessons 
  end

  # GET /lessons/1 or /lessons/1.json
  def show
  end


  # GET /lessons/new
  def new
    @lesson = @school.lessons.build
    authorize @lesson
  end

  # GET /lessons/1/edit
  def edit
    authorize @lesson
  end

  # POST /lessons or /lessons.json
  def create
    unless signed_in?
      redirect_to new_user_session_path
    else
      authorize Lesson 
        @lesson = @school.lessons.build(lesson_params)

        respond_to do |format|
          if @lesson.save
            format.html { redirect_to school_lessons_path(@school), notice: "Lesson was successfully created." }
            format.json { render :show, status: :created, location: @lesson }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @lesson.errors, status: :unprocessable_entity }
          end
        end
      end
  end

  # PATCH/PUT /lessons/1 or /lessons/1.json
  def update
    unless signed_in?
      redirect_to new_user_session_path
    else
      authorize Lesson
        respond_to do |format|
          if @lesson.update(lesson_params)
            format.html { redirect_to lesson_path(@lesson), notice: "Lesson was successfully updated." }
            format.json { render :show, status: :ok, location: @lesson }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @lesson.errors, status: :unprocessable_entity }
          end
        end
      end
  end

  # DELETE /lessons/1 or /lessons/1.json
  def destroy
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to school_lessons_path(@school), notice: "Lesson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    def get_school
      @school = School.find(params[:school_id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_params
      params.require(:lesson).permit(:lessname, :lessnum, :lessfield, :startdate, :enddate, :starttime, :endtime, :school_id)
    end
end
