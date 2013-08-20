class SalesController < ApplicationController
  before_action :signed_in_user
  before_action :set_sale, only: [:show, :edit, :update]
  before_action :admin_user,   only: [:destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.paginate(page: params[:page])
    @parents = Parent.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    if @sale.save

      @parent = Parent.find(@sale.spcompany)
      @parentcomm = @parent.partentcomm
      @sale.update(:parentcomm => @parentcomm )

      flash[:success] = "Sales person information was successfully created"
      redirect_to @sale
    else
      render 'new'
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    if @sale.update(sale_params)

      @parent = Parent.find(@sale.spcompany)
      @parentcomm = @parent.partentcomm
      @sale.update(:parentcomm => @parentcomm )

      flash[:success] = "Sale person record was successfully updated"
      redirect_to @sale
    else
      render 'edit'
    end

  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy

    Sale.find(params[:id]).destroy
    flash[:success] = "Sales person details destroyed."
    redirect_to sales_url

    #@sale.destroy
    #respond_to do |format|
    #  format.html { redirect_to sales_url }
    # format.json { head :no_content }
    #end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sale
    @sale = Sale.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sale_params
    params.require(:sale).permit(:spname, :spcompany, :spcomm, :parentcomm)
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def admin_user
    flash[:success] = "Only ADMIN can perform this action!"
    redirect_to(sales_path) unless current_user.admin?
  end
end
