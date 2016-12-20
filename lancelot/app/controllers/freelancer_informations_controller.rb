class FreelancerInformationsController < ApplicationController
  before_action :set_freelancer_information, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  

  # GET /freelancer_informations
  # GET /freelancer_informations.json
  def index
    @freelancer_informations = FreelancerInformation.all
  end

  # GET /freelancer_informations/1
  # GET /freelancer_informations/1.json
  def show
  end

  # GET /freelancer_informations/new
  def new
    @freelancer_information = FreelancerInformation.new
  end

  # GET /freelancer_informations/1/edit
  def edit
  end

  # POST /freelancer_informations
  # POST /freelancer_informations.json
  def create
    @freelancer_information = FreelancerInformation.new(freelancer_information_params)

    respond_to do |format|
      if @freelancer_information.save
        format.html { redirect_to @freelancer_information, notice: 'Freelancer information was successfully created.' }
        format.json { render :show, status: :created, location: @freelancer_information }
      else
        format.html { render :new }
        format.json { render json: @freelancer_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /freelancer_informations/1
  # PATCH/PUT /freelancer_informations/1.json
  def update
    respond_to do |format|
      if @freelancer_information.update(freelancer_information_params)
        format.html { redirect_to @freelancer_information, notice: 'Freelancer information was successfully updated.' }
        format.json { render :show, status: :ok, location: @freelancer_information }
      else
        format.html { render :edit }
        format.json { render json: @freelancer_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /freelancer_informations/1
  # DELETE /freelancer_informations/1.json
  def destroy
    @freelancer_information.destroy
    respond_to do |format|
      format.html { redirect_to freelancer_informations_url, notice: 'Freelancer information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_freelancer_information
      @freelancer_information = FreelancerInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def freelancer_information_params
      params.require(:freelancer_information).permit(:description, :location, :email, :phone, :skype, :website, :user_id)
    end
end
