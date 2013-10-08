class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /services/:service_id/type_of_products/:type_of_product_id/products
  def index
    @products = Product.all
    @service = Service.find(params[:service_id])
    @type_of_product = TypeOfProduct.find(params[:type_of_product_id])
  end

  # GET /services/:service_id/type_of_products/:type_of_product_id/products/1
  def show
  end

  # GET /services/:service_id/type_of_products/:type_of_product_id/products/new
  def new
    @product = Product.new
    @service = Service.find(params[:service_id])
    @type_of_product = TypeOfProduct.find(params[:type_of_product_id])
  end

  # GET /services/:service_id/type_of_products/:type_of_product_id/products/1/edit
  def edit
    @service = Service.find(params[:service_id])
    @type_of_product = TypeOfProduct.find(params[:type_of_product_id])
  end

  # POST /services/:service_id/type_of_products/:type_of_product_id/products
  def create
    @product = Product.new(product_params)
    @product.type_of_product = TypeOfProduct.find(params[:type_of_product_id])
    @product.type_of_product.service = Service.find(params[:service_id])

    respond_to do |format|
      if @product.save
        format.html {
          redirect_to [@product.type_of_product.service, @product.type_of_product, @product], 
          notice: 'Product was successfully created.'
        }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /services/:service_id/type_of_products/:type_of_product_id/products/1
  def update
    @service = Service.find(params[:service_id])
    @type_of_product = TypeOfProduct.find(params[:type_of_product_id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to [@service, @type_of_product, @product], notice: 'Product was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /services/:service_id/type_of_products/:type_of_product_id/products/1
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to service_type_of_products_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :title, :description, :picture_url)
    end
end
