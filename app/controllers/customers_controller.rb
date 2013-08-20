class CustomersController < ApplicationController
  before_action :signed_in_user
  before_action :set_customer, only: [:show, :edit, :update ]
  before_action :admin_user,   only: [:destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.paginate(page: params[:page]) 
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
    @sale = Sale.find(@customer.source)

    if @customer.save

      # Add a line in Salestransaction for Sales person 1
      @startdate = @customer.sdate
      @tabid = @customer.rstid
      @sid = @customer.source
      @samount = @customer.monthlyrate
      @parent = @sale.spcompany
      @scomm = (@customer.commission1 * @samount) / 100
      @commsdate = @customer.sdate + @customer.trialdays.days

      @strans = Salestransaction.new( :sdate => @startdate, :table37id => @tabid, :salesid => @sid, :salesamount => @samount, :salescommission => @scomm, :parentcompany => @parent, :relationship => "S", :commsdate => @commsdate)
      @strans.save

      # Add a line in Salestransaction for Sales person 2
      if @customer.source2.blank? == false
        @sid2 = @customer.source2
        @scomm2 = (@customer.commission2 * @samount) / 100
        @strans = Salestransaction.new( :sdate => @startdate, :table37id => @tabid, :salesid => @sid2, :salesamount => @samount, :salescommission => @scomm2, :parentcompany => @parent, :relationship => "S", :commsdate => @commsdate)
        @strans.save
      end

      # Add a line in Salestransaction for parent company

      @parentcomm = (@sale.parentcomm * @samount) / 100
      @strans = Salestransaction.new( :sdate => @startdate, :table37id => @tabid, :salesid => "NA", :salesamount => @samount, :salescommission => @parentcomm, :parentcompany => @parent, :relationship => "P", :commsdate => @commsdate)
      @strans.save

      flash[:success] = "Customer was successfully created"
      redirect_to @customer
    else
      render 'new'
    end
  end

  def update
    @customer = Customer.find(params[:id])


    if @customer.update_attributes(customer_params)

      # Update a line in Salestransaction for Sales person 1
      @sale = Sale.find(@customer.source)
      stran = Salestransaction.find(@customer.source)

      stran.sdate = @customer.sdate
      stran.table37id = @customer.rstid
      stran.salesid = @customer.source
      stran.salesamount = @customer.monthlyrate
      stran.salescommission = (@customer.commission1 * @samount) / 100
      stran.relationship = "S"
      stran.parentcompany = @sale.spcompany
      stran.commsdate =  @customer.sdate + @customer.trialdays.days

      @strans.save

      # Update a line in Salestransaction for Sales person 2
      if @customer.source2.blank? == false


        stran.sdate = @customer.sdate
        stran.table37id = @customer.rstid
        stran.salesid = @customer.source2
        stran.salesamount = @customer.monthlyrate
        stran.salescommission = (@customer.commission2 * @samount) / 100
        stran.relationship = "S"
        stran.parentcompany = @sale.spcompany
        stran.commsdate =  @customer.sdate + @customer.trialdays.days

        @strans.save
      end

      # Update a line in Salestransaction for parent company

      stran.sdate = @customer.sdate
      stran.table37id = @customer.rstid
      stran.salesid = "NA"
      stran.salesamount = @customer.monthlyrate
      stran.salescommission = (@sale.parentcomm * @samount) / 100
      stran.relationship = "P"
      stran.parentcompany = @sale.spcompany
      stran.commsdate =  @customer.sdate + @customer.trialdays.days

      @strans.save

      flash[:success] = "Customer Infomation updated"
      redirect_to @customer
    else
      render 'edit'
    end


  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    Customer.find(params[:id]).destroy
    flash[:success] = "Customer destroyed."
    redirect_to customers_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_params
    params.require(:customer).permit(:rstid, :rstname, :source, :sdate, :trialdays, :plantype, :monthlyrate, :ipadsold, :standsold, :ipadrate, :standrate, :rstowner, :rstaddress, :rstcity, :rststate, :rstzip, :rstcontact, :rstmgrcontact, :rstemail, :paymode, :salestax, :ipadserialno, :payfreq, :salesid1, :salesid2, :source2, :commission1, :commission2,:table37rep)
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
