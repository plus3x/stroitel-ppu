class ProductsController < ApplicationController
  before_action :set_product,         only: %i(show edit update destroy)
  before_action :set_service,         except: :destroy
  before_action :set_type_of_product, except: :destroy

  # GET /services/:service_id/type_of_products/:type_of_product_id/products
  def index
    @products = Product.all
  end

  # GET /services/:service_id/type_of_products/:type_of_product_id/products/1
  def show() end

  # GET /services/:service_id/type_of_products/:type_of_product_id/products/new
  def new
    @product = Product.new seo_meta: SeoMeta.new
  end

  # GET /services/:service_id/type_of_products/:type_of_product_id/products/1/edit
  def edit() end

  # POST /services/:service_id/type_of_products/:type_of_product_id/products
  def create
    if ( @product = Product.new(product_params) ).save
      redirect_to [@service, @type_of_product, @product], notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /services/:service_id/type_of_products/:type_of_product_id/products/1
  def update
    if @product.update product_params
      redirect_to [@service, @type_of_product, @product], notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /services/:service_id/type_of_products/:type_of_product_id/products/1
  def destroy
    @product.destroy
    redirect_to service_type_of_products_url
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_service
    @service = Service.find(params[:service_id])
  end

  def set_type_of_product
    @type_of_product = TypeOfProduct.find(params[:type_of_product_id])
  end

  def product_params
    params.require(:product).permit(
      :name, :title, :description, :picture_url,
      seo_meta_attributes: [:keywords, :description]
    ).merge type_of_product_id: params[:type_of_product_id]
  end
end
