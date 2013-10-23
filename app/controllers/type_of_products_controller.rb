class TypeOfProductsController < ApplicationController
  before_action :set_type_of_product, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  # GET /services/:service_id/type_of_products
  def index
    @type_of_products = TypeOfProduct.all
    fresh_when [@type_of_products, current_user], public: true
    @head_title       = I18n.t('.type_of_products.index.head_title')
    @meta_keywords    = I18n.t('.type_of_products.index.meta_keywords')
    @meta_description = I18n.t('.type_of_products.index.meta_description')
    @service = Service.find(params[:service_id])
  end

  # GET /services/:service_id/type_of_products/1
  def show
    @products = @type_of_product.products
    fresh_when [@products, current_user], public: true
    @head_title       = I18n.t('.type_of_products.show.head_title',             title: @type_of_product.name)
    @meta_keywords    = I18n.t('.type_of_products.show.meta_keywords',       keywords: @type_of_product.seo_meta.keywords)
    @meta_description = I18n.t('.type_of_products.show.meta_description', description: @type_of_product.seo_meta.description)
    @service = Service.find(params[:service_id])
  end

  # GET /services/:service_id/type_of_products/new
  def new
    @type_of_product = TypeOfProduct.new
    @type_of_product.seo_meta = SeoMeta.new
    @service = Service.find(params[:service_id])
  end

  # GET /services/:service_id/type_of_products/1/edit
  def edit
    @service = Service.find(params[:service_id])
  end

  # POST /services/:service_id/type_of_products
  def create
    @type_of_product = TypeOfProduct.new(type_of_product_params)
    @service = Service.find(params[:service_id])
    @type_of_product.service = @service
    @type_of_product_seo_meta = SeoMeta.new(type_of_product_params[:seo_meta_attributes])
    respond_to do |format|
      if @type_of_product.save and @type_of_product_seo_meta.save
        format.html { redirect_to [@service, @type_of_product], notice: 'Type of product was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /services/:service_id/type_of_products/1
  def update
    @service = Service.find(params[:service_id])
    respond_to do |format|
      if @type_of_product.update(type_of_product_params) and @type_of_product.seo_meta.update(type_of_product_params[:seo_meta_attributes])
        format.html { redirect_to [@service, @type_of_product], notice: 'Type of product was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /services/:service_id/type_of_products/1
  def destroy
    @type_of_product.seo_meta.destroy
    @type_of_product.destroy
    respond_to do |format|
      format.html { redirect_to service_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_of_product
      @type_of_product = TypeOfProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_of_product_params
      params.require(:type_of_product).permit(:name, :title, :description, :picture_url, seo_meta_attributes: [:keywords, :description])
    end
end
