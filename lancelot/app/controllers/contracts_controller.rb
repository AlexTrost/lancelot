class ContractsController < ApplicationController
  before_filter :authenticate_user!
  

  def index
    @contracts = Contract.all
  end

  def show
    @contract = Contract.find(params[:id])
  end

  def new
  	@freelancer = FreelancerInformation.find(params[:freelancer_information_id])
    @post = Post.find(params[:post_id])
  	@application = Application.where(post: @post, freelancer_information: @freelancer).first
  	if @freelancer == current_user.freelancer_information
    	@contract = Contract.new
    	@contract.post = @post
    	@contract.project_start = @application.project_start
    	@contract.project_end = @application.project_end
    	@contract.hourly = @application.hourly
    	@contract.amount = @application.amount
    	@contract.payment_protection = @application.payment_protection
    	@contract.weekly_hours = @application.weekly_hours
    	@contract.payment_interval = @application.payment_interval
  	else
  		redirect_to "/"
  	end
  end

  # GET /contracts/1/edit
  def edit
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(contract_params)
    poster = @contract.post.poster_information.user
    respond_to do |format|
      if @contract.save
        UserNotifier.send_contract_ready_to_approve_for_poster_email(user, @contract).deliver_later
        format.html { redirect_to '/dashboard', notice: "Contract was successfully created and has been sent to employer. You will be notified when they have approved it, at which point you will be asked to sign." }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  def action
  	@post = Post.find(params[:post_id])
  	@contract = @post.contract
  	@application = Application.where(freelancer_information_id: @post.awarded_to_id, post: @post).first
  	@user = current_user
  end

  def approve
  	@contract = Contract.find(params[:id])
  	@post = @contract.post
  	@application = Application.where(freelancer_information_id: @post.awarded_to_id, post: @post).first
  	poster = current_user.poster_information.id == @post.poster_information_id
  	if poster  
      freelancer = FreelancerInformation.find(@post.awarded_to_id).user  
      @contract.update_attributes(poster_approved: true) 
      UserNotifier.send_contract_ready_to_sign_for_freelancer_email(freelancer, @contract).deliver_later
    end
  	render "action"
  end

  def sign
  	@contract = Contract.find(params[:id])
  	@post = @contract.post
    poster = PosterInformation.find(@post.poster_information_id).user
  	@application = Application.where(freelancer_information_id: @post.awarded_to_id, post: @post).first
  	if current_user.poster_information.id == @post.poster_information_id
  		@contract.update_attributes(poster_signed: true)
  	elsif  current_user.freelancer_information.id == @post.awarded_to_id
  		@contract.update_attributes(freelancer_signed: true)
      if @contract.poster_approved == false
        UserNotifier.send_contract_ready_to_sign_for_poster_email(poster, @contract).deliver_later
      else
        UserNotifier.send_safepay_needed(poster, @contract).deliver_later
      end
  	else
  	end
  	respond_to do |format|
      format.html { render :action }
      # format.json { render json: @contract.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /contracts/1
  # PATCH/PUT /contracts/1.json
  def update
    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to @contract, notice: 'Contract was successfully updated.' }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract.destroy
    respond_to do |format|
      format.html { redirect_to contracts_url, notice: 'Contract was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @contract = Contract.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_params
      params.require(:contract).permit(:hourly, :amount, :payment_protection, :freelancer_signed, :poster_signed, :freelancer_approved, :poster_approved, :weekly_hours, :payment_interval, :project_start, :post_id, :project_end )
    end
end
