class TypeOfProductsController < ApplicationController
  before_action :set_type_of_product, only: [:show, :edit, :update, :destroy]
  before_action :set_service,         except: :destroy

  # GET /services/:service_id/type_of_products
  def index
    @type_of_products = TypeOfProduct.all
    fresh_when [@type_of_products, current_user], public: true
  end

  # GET /services/:service_id/type_of_products/1
  def show
    @products = @type_of_product.products
    fresh_when [@products, current_user], public: true
  end

  # GET /services/:service_id/type_of_products/new
  def new
    @type_of_product = TypeOfProduct.new seo_meta: SeoMeta.new
  end

  # GET /services/:service_id/type_of_products/1/edit
  def edit
  end

  # POST /services/:service_id/type_of_products
  def create
    @type_of_product = TypeOfProduct.new(type_of_product_params)
    @type_of_product.service = @service
    respond_to do |format|
      if @type_of_product.save
        format.html { redirect_to [@service, @type_of_product], notice: 'Type of product was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /services/:service_id/type_of_products/1
  def update
    respond_to do |format|
      if @type_of_product.update(type_of_product_params)
        format.html { redirect_to [@service, @type_of_product], notice: 'Type of product was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /services/:service_id/type_of_products/1
  def destroy
    @type_of_product.destroy
    respond_to do |format|
      format.html { redirect_to Service.find(params[:service_id]) }
    end
  end

  private

    def set_type_of_product
      @type_of_product = TypeOfProduct.find(params[:id])
    end

    def set_service
      @service = Service.find(params[:service_id])
    end

    def type_of_product_params
      params.require(:type_of_product).permit(:name, :title, :description, :picture_url, seo_meta_attributes: [:keywords, :description])
    end
end
