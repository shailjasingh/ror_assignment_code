class EnrollmentsController < ApplicationController
    before_action :set_enrollment, only: %i[ show edit update destroy ]
  
    # GET /enrollments
    def index
      @enrollments = Enrollment.all
    end
  
    # GET /enrollments/1
    def show
    end
  
    # GET /enrollments/new
    def new
      @enrollment = Enrollment.new
      @coordinators = Coordinator.all
      @participants = Participant.all
    end
  
    # GET /enrollments/1/edit
    def edit
        @coordinators = Coordinator.all
        @participants = Participant.all
    end
  
    # POST /enrollments
    def create
      @enrollment = Enrollment.new(enrollment_params)
      @enrollment.coordinator = Coordinator.find(params[:enrollment][:coordinators_ids])
      @enrollment.participant =  Participant.find(params[:enrollment][:participants_ids])
      
      respond_to do |format|
        if @enrollment.save!
          format.html { redirect_to enrollment_url(@enrollment), notice: "enrollment was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /enrollments/1 
    def update
      respond_to do |format|
        if @enrollment.update(enrollment_params)
          format.html { redirect_to enrollment_url(@enrollment), notice: "enrollment was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /enrollments/1
    def destroy
      @enrollment.destroy
  
      respond_to do |format|
        format.html { redirect_to enrollments_url, notice: "enrollment was successfully destroyed." }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_enrollment
        @enrollment = Enrollment.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def enrollment_params
        params.require(:enrollment).permit(:date_of_enrollment, :remarks, :contact_mode,  coordinator_ids: [], participant_ids: [] )
      end
  end
  