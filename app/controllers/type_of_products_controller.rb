class TypeOfProductsController < ApplicationController
  before_action :set_type_of_product, only: [:show, :edit, :update, :destroy]

  # GET /type_of_products
  # GET /type_of_products.json
  def index
    @type_of_products = TypeOfProduct.all
  end

  # GET /type_of_products/1
  # GET /type_of_products/1.json
  def show
  end

  # GET /type_of_products/new
  def new
    @type_of_product = TypeOfProduct.new
  end

  # GET /type_of_products/1/edit
  def edit
  end

  # POST /type_of_products
  # POST /type_of_products.json
  def create
    @type_of_product = TypeOfProduct.new(type_of_product_params)

    respond_to do |format|
      if @type_of_product.save
        format.html { redirect_to @type_of_product, notice: 'Type of product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @type_of_product }
      else
        format.html { render action: 'new' }
        format.json { render json: @type_of_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_of_products/1
  # PATCH/PUT /type_of_products/1.json
  def update
    respond_to do |format|
      if @type_of_product.update(type_of_product_params)
        format.html { redirect_to @type_of_product, notice: 'Type of product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @type_of_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_of_products/1
  # DELETE /type_of_products/1.json
  def destroy
    @type_of_product.destroy
    respond_to do |format|
      format.html { redirect_to type_of_products_url }
      format.json { head :no_content }
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
