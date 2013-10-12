class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:new, :create]
  after_action :send_invoice, only: [:create]

  # GET /orders
  def index
    @orders = Order.all
    expires_in 10.minutes, public: true
    fresh_when @orders, public: true
  end

  # GET /orders/1
  def show
    expires_in 10.minutes, public: true
    fresh_when @order, public: true
  end

  # GET /orders/new
  def new
    expires_in 10.minutes, public: true
    fresh_when current_user, public: true
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /orders/1
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
    end
  end

  private
    
    def send_invoice
      UserNotifier.invoice(order_params[:email]).deliver
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:email, :description)
    end
end
