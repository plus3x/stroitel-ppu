class TypeOfProductsController < ApplicationController
  before_action :set_type_of_product, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  # GET /services/:service_id/type_of_products
  def index
    @meta_keywords = 'Трубы Трубень Трубенище Отрубеть'
    @meta_description = 'Три тыщи труб тебе в зад!'
    @type_of_products = TypeOfProduct.all
  end

  # GET /services/:service_id/type_of_products/1
  def show
    @meta_keywords = 'Трубы Трубень Трубенище Отрубеть'
    @meta_description = 'Три тыщи труб тебе в зад!'
    @service = Service.find(params[:service_id])
  end

  # GET /services/:service_id/type_of_products/new
  def new
    @type_of_product = TypeOfProduct.new
    @service = Service.find(params[:service_id])
  end

  # GET /services/:service_id/type_of_products/1/edit
  def edit
    @service = Service.find(params[:service_id])
  end

  # POST /services/:service_id/type_of_products
  def create
    @type_of_product = TypeOfProduct.new(type_of_product_params)
    @type_of_product.service = Service.find(params[:service_id])

    respond_to do |format|
      if @type_of_product.save
        format.html { redirect_to [@type_of_product.service, @type_of_product], notice: 'Type of product was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /services/:service_id/type_of_products/1
  def update
    @service = Service.find(params[:service_id])
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
      params.require(:type_of_product).permit(:name, :title, :description, :picture_url)
    end
end
