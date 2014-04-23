class ProductsController < ApplicationController
  before_action :set_product,         only: [:show, :edit, :update, :destroy]
  before_action :set_service,         except: :destroy
  before_action :set_type_of_product, except: :destroy

  # GET /services/:service_id/type_of_products/:type_of_product_id/products
  def index
    @products = Product.all
    fresh_when [@products, current_user], public: true
  end

  # GET /services/:service_id/type_of_products/:type_of_product_id/products/1
  def show
    fresh_when [@product, current_user], public: true
  end

  # GET /services/:service_id/type_of_products/:type_of_product_id/products/new
  def new
    @product = Product.new seo_meta: SeoMeta.new
  end

  # GET /services/:service_id/type_of_products/:type_of_product_id/products/1/edit
  def edit
  end

  # POST /services/:service_id/type_of_products/:type_of_product_id/products
  def create
    @product = Product.new(product_params)
    @product.type_of_product = @type_of_product
    @product.type_of_product.service = @service
    respond_to do |format|
      if @product.save
        format.html {
          redirect_to [@service, @type_of_product, @product], notice: 'Product was successfully created.'
        }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /services/:service_id/type_of_products/:type_of_product_id/products/1
  def update
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
      params.require(:product).permit(:name, :title, :description, :picture_url, seo_meta_attributes: [:keywords, :description])
    end
end
