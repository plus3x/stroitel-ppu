class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /services/:service_id/type_of_products/:type_of_product_id/products
  def index
    @products = Product.all
    fresh_when [@products, current_user], public: true
    @head_title       = I18n.t('.products.index.head_title')
    @meta_keywords    = I18n.t('.products.index.meta_keywords')
    @meta_description = I18n.t('.products.index.meta_description')
    @service = Service.find(params[:service_id])
    @type_of_product = TypeOfProduct.find(params[:type_of_product_id])
  end

  # GET /services/:service_id/type_of_products/:type_of_product_id/products/1
  def show
    fresh_when [@product, current_user], public: true
    @head_title       = I18n.t('.products.show.head_title',             title: @product.name)
    @meta_keywords    = I18n.t('.products.show.meta_keywords',       keywords: @product.seo_meta.keywords)
    @meta_description = I18n.t('.products.show.meta_description', description: @product.seo_meta.description)
    @service = Service.find(params[:service_id])
    @type_of_product = TypeOfProduct.find(params[:type_of_product_id])
  end

  # GET /services/:service_id/type_of_products/:type_of_product_id/products/new
  def new
    @product = Product.new
    @product.seo_meta = SeoMeta.new
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
    @product_seo_meta = SeoMeta.new(product_params[:seo_meta_attributes])
    @service = Service.find(params[:service_id])
    @type_of_product = TypeOfProduct.find(params[:type_of_product_id])
    @product.type_of_product = @type_of_product
    @product.type_of_product.service = @service
    respond_to do |format|
      if @product.save and @product_seo_meta.save
        format.html {
          redirect_to [@service, @type_of_product, @product], 
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
      if @product.update(product_params) and @product.seo_meta.update(product_params[:seo_meta_attributes])
        format.html { redirect_to [@service, @type_of_product, @product], notice: 'Product was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /services/:service_id/type_of_products/:type_of_product_id/products/1
  def destroy
    @product.seo_meta.destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to service_type_of_products_url }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :title, :description, :picture_url, seo_meta_attributes: [:keywords, :description])
    end
end
