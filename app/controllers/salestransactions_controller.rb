class SalestransactionsController < ApplicationController
  before_action :signed_in_user
  before_action :set_salestransaction, only: [:show, :edit, :update]
  before_action :admin_user,   only: [:destroy]

  # GET /salestransactions
  # GET /salestransactions.json
  def index
    @salestransactions = Salestransaction.all
    @sale = Sale.find(:all)

  end

  # GET /salestransactions/1
  # GET /salestransactions/1.json
  def show
  end

  # GET /salestransactions/new
  def new
    @salestransaction = Salestransaction.new
  end

  # GET /salestransactions/1/edit
  def edit
  end

  # POST /salestransactions
  # POST /salestransactions.json
  def create
    @salestransaction = Salestransaction.new(salestransaction_params)

    respond_to do |format|
      if @salestransaction.save

        flash[:success] = "Sales Transaction was successfully created"
        redirect_to @salestransaction

        #format.html { redirect_to @salestransaction, notice: 'Salestransaction was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @salestransaction }
      else
        render 'new'
        #format.html { render action: 'new' }
        #format.json { render json: @salestransaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salestransactions/1
  # PATCH/PUT /salestransactions/1.json
  def update
    respond_to do |format|
      if @salestransaction.update(salestransaction_params)
        format.html { redirect_to @salestransaction, notice: 'Salestransaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @salestransaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salestransactions/1
  # DELETE /salestransactions/1.json
  def destroy
    @salestransaction.destroy
    respond_to do |format|
      format.html { redirect_to salestransactions_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_salestransaction
    @salestransaction = Salestransaction.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def salestransaction_params
    params.require(:salestransaction).permit(:sdate, :table37id, :salesid, :salesamount, :salescommission)
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def admin_user
    flash[:success] = "Only ADMIN can perform this action!"
    redirect_to(salestrasactions_path) unless current_user.admin?
  end
end
