class PosterInformationsController < ApplicationController
  before_action :set_poster_information, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  

  # GET /poster_informations
  # GET /poster_informations.json
  def index
    @poster_informations = PosterInformation.all
  end

  # GET /poster_informations/1
  # GET /poster_informations/1.json
  def show
  end

  # GET /poster_informations/new
  def new
    @poster_information = PosterInformation.new
  end

  # GET /poster_informations/1/edit
  def edit
  end

  # POST /poster_informations
  # POST /poster_informations.json
  def create
    @poster_information = PosterInformation.new(poster_information_params)

    respond_to do |format|
      if @poster_information.save
        format.html { redirect_to @poster_information, notice: 'Poster information was successfully created.' }
        format.json { render :show, status: :created, location: @poster_information }
      else
        format.html { render :new }
        format.json { render json: @poster_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poster_informations/1
  # PATCH/PUT /poster_informations/1.json
  def update
    respond_to do |format|
      if @poster_information.update(poster_information_params)
        format.html { redirect_to @poster_information, notice: 'Poster information was successfully updated.' }
        format.json { render :show, status: :ok, location: @poster_information }
      else
        format.html { render :edit }
        format.json { render json: @poster_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poster_informations/1
  # DELETE /poster_informations/1.json
  def destroy
    @poster_information.destroy
    respond_to do |format|
      format.html { redirect_to poster_informations_url, notice: 'Poster information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poster_information
      @poster_information = PosterInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poster_information_params
      params.require(:poster_information).permit(:description, :location, :email, :phone, :skype, :website, :user_id)
    end
end
