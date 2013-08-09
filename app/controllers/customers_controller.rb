class CustomersController < ApplicationController
  before_action :signed_in_user
  before_action :set_customer, only: [:show, :edit, :update ]
  before_action :admin_user,   only: [:destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      @startdate = @customer.sdate
      @tabid = @customer.rstid
      @sid = @customer.source
      @samount = @customer.monthlyrate

      @scomm = (@customer.commission1 * @samount) / 100

      @strans = Salestransaction.new( :sdate => @startdate, :table37id => @tabid, :salesid => @sid, :salesamount => @samount, :salescommission => @scomm)
      @strans.save

      if @customer.source2.blank? == false
        @sid2 = @customer.source2
        @scomm2 = (@customer.commission2 * @samount) / 100
        @strans = Salestransaction.new( :sdate => @startdate, :table37id => @tabid, :salesid => @sid2, :salesamount => @samount, :salescommission => @scomm2)
        @strans.save
      end


      flash[:success] = "Customer was successfully created"
      redirect_to @customer
      #format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
      #format.json { render action: 'show', status: :created, location: @customer }
    else
      render 'new'
    end
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)


      if @customer.save
        @startdate = @customer.sdate
        @tabid = @customer.rstid
        @sid = @customer.source
        @samount = @customer.monthlyrate

        @scomm = (@customer.commission1 * @samount) / 100

        @strans = Salestransaction.new( :sdate => @startdate, :table37id => @tabid, :salesid => @sid, :salesamount => @samount, :salescommission => @scomm)
        @strans.save

        if @customer.source2.blank? == false
          @sid2 = @customer.source2
          @scomm2 = (@customer.commission2 * @samount) / 100
          @strans = Salestransaction.new( :sdate => @startdate, :table37id => @tabid, :salesid => @sid2, :salesamount => @samount, :salescommission => @scomm2)
          @strans.save
        end

        flash[:success] = "Customer Infomation updated"
        redirect_to @customer
      else
        render 'edit'
      end
    end

    # DELETE /customers/1
    # DELETE /customers/1.json
    def destroy
      @customer.destroy
      respond_to do |format|
        format.html { redirect_to customers_url }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:rstid, :rstname, :source, :sdate, :trialdays, :plantype, :monthlyrate, :ipadsold, :standsold, :ipadrate, :standrate, :rstowner, :rstaddress, :rstcity, :rststate, :rstzip, :rstcontact, :rstmgrcontact, :rstemail, :paymode, :salestax, :ipadserialno, :payfreq, :salesid1, :salesid2, :source2, :commission1, :commission2)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def admin_user
      flash[:success] = "Only ADMIN can perform this action!"
      redirect_to(customers_path) unless current_user.admin?
    end

  end
