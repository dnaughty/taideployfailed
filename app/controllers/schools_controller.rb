class SchoolsController < ApplicationController
  before_action :get_district, only: %i[create new index]
  before_action :set_school, only: %i[ show edit update destroy ]

  # GET /schools or /schools.json
  def index
    @schools = @district.schools
  end

  # GET /schools/1 or /schools/1.json
  def show
  end

  # GET /schools/new
  def new
    @school = @district.schools.build
    authorize @district
  end

  # GET /schools/1/edit
  def edit
   
  end

  # POST /schools or /schools.json
  def create

    unless signed_in?
      redirect_to new_user_session_path
    else
      authorize District
        @school = @district.schools.build(school_params)

        respond_to do |format|
          if @school.save
            format.html { redirect_to district_schools_path(@district), notice: "School was successfully created." }
            format.json { render :show, status: :created, location: @school }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @school.errors, status: :unprocessable_entity }
          end
        end
      end
    end

  # PATCH/PUT /schools/1 or /schools/1.json
  def update
    unless signed_in?
      redirect_to new_user_session_path
    else
      authorize District
        respond_to do |format|
          if @school.update(school_params)
            format.html { redirect_to school_path(@school), notice: "School was successfully updated." }
            format.json { render :show, status: :ok, location: @school }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @school.errors, status: :unprocessable_entity }
          end
        end
      end
  end

  # DELETE /schools/1 or /schools/1.json
  def destroy
    @school.destroy

    respond_to do |format|
      format.html { redirect_to districts_path(@school.district_id), notice: "School was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    def get_district
      @district = District.find(params[:district_id])
    end

    # Only allow a list of trusted parameters through.
    def school_params
      params.require(:school).permit(:sname, :street, :stown, :sstate, :szip, :district_id)
    end
end
