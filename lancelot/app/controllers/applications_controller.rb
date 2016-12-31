class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]

  # GET /applications
  # GET /applications.json
  def index
    @applications = current_user.applications
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
  end

  # GET /applications/new
  def new
    @application = Application.new
    @post = Post.find(params[:post_id])
  end

  # GET /applications/1/edit
  def edit
  end

  def index_by_post
    @applications = Application.where(post_id: params[:post_id])
    render "index"
  end

  def award
    application = Application.find(params[:application_id])
    post = application.post
    awardee = application.freelancer_information
    post.update_attributes(awarded_to_id: awardee.id)
    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: 'Job has been awarded. The freelancer has been notified and will have 72 hours to accept or reject the offer. If they accept, you will recieve a more specific agreement from them over which you will have the power to negociate.' }
    end
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(application_params)

    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:hourly, :freelancer_information_id, :post_id, :description, :amount, :payment_protection)
    end
end
