class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  after_action :send_invoice, only: [:create]
  skip_before_action :set_public_proxy_refresh

  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    @services = Service.all
    fresh_when [@services, current_user], public: true
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    if ( @order = Order.new(order_params) ).save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update order_params
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url
  end

  private
    
    def send_invoice
      UserNotifier.invoice(order_params[:email]).deliver
    end

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:email, :description)
    end
end
