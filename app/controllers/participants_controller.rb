class ParticipantsController < ApplicationController
  before_action :set_participant, only: %i[ show edit update destroy ]

  # GET /participants or /participants.json
  def index
    @participants = Participant.all
  end

  # GET /participants/1 or /participants/1.json
  def show
  end

  # GET /participants/new
  def new
    @participant = Participant.new
    @registries = Registry.where(state: "open")
  end

  # GET /participants/1/edit
  def edit
    @registries = Registry.where(state: "open")
  end

  # POST /participants or /participants.json
  def create
    @participant = Participant.new(participant_params)
    @participant.registry = Registry.find params[:participant][:registry_ids]
    respond_to do |format|
      if @participant.save!
        format.html { redirect_to participant_url(@participant), notice: "Participant was successfully created." }
        format.json { render :show, status: :created, location: @participant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participants/1 or /participants/1.json
  def update
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to participant_url(@participant), notice: "Participant was successfully updated." }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1 or /participants/1.json
  def destroy
    @participant.destroy

    respond_to do |format|
      format.html { redirect_to participants_url, notice: "Participant was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def aggregate_count_by_dob
    @participants = Participant.all.group_by{|m| m.dob}
  end

  def aggregate_count_by_coordinator_and_gender
    @participants = Participant.joins(:coordinators).group('gender', 'coordinators.id')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def participant_params
      params.require(:participant).permit(:name, :gender, :dob, registry_ids: [])
    end
end
