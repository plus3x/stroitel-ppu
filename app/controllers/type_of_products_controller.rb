class TypeOfProductsController < ApplicationController
  before_action :set_type_of_product, only: %i(show edit update destroy)
  before_action :set_service

  # GET /services/:service_id/type_of_products
  def index
    @type_of_products = TypeOfProduct.all
  end

  # GET /services/:service_id/type_of_products/1
  def show() end

  # GET /services/:service_id/type_of_products/new
  def new
    @type_of_product = TypeOfProduct.new seo_meta: SeoMeta.new
  end

  # GET /services/:service_id/type_of_products/1/edit
  def edit() end

  # POST /services/:service_id/type_of_products
  def create
    if ( @type_of_product = TypeOfProduct.new(type_of_product_params) ).save
      redirect_to [@service, @type_of_product], notice: 'Type of product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /services/:service_id/type_of_products/1
  def update
    if @type_of_product.update type_of_product_params
      redirect_to [@service, @type_of_product], notice: 'Type of product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /services/:service_id/type_of_products/1
  def destroy
    @type_of_product.destroy
    redirect_to @service
  end

  private

  def set_type_of_product
    @type_of_product = TypeOfProduct.find(params[:id])
  end

  def set_service
    @service = Service.find(params[:service_id])
  end

  def type_of_product_params
    params.require(:type_of_product).permit(
      :name, :title, :description, :picture_url,
      seo_meta_attributes: [:keywords, :description]
    ).merge service_id: params[:service_id]
  end
end
