class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  # GET /services
  def index
    @services = Service.all
    expires_in 10.minutes, public: true
    fresh_when @services, public: true
    @meta_keywords = 'Трубы Трубень Трубенище Отрубеть'
    @meta_description = 'Три тыщи труб тебе в зад!'
  end

  # GET /services/1
  def show
    @type_of_products = @service.type_of_products
    expires_in 10.minutes, public: true
    fresh_when @type_of_products, public: true
    @meta_keywords = @service.seo_meta.keywords
    @meta_description = @service.seo_meta.description
  end

  # GET /services/new
  def new
    @service = Service.new
    @service.seo_meta = SeoMeta.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  def create
    @service = Service.new(service_params)
    @service_seo_meta = SeoMeta.new(service_params[:seo_meta_attributes])
    respond_to do |format|
      if @service.save and @service_seo_meta.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /services/1
  def update
    respond_to do |format|
      if @service.update(service_params) and @service.seo_meta.update(service_params[:seo_meta_attributes])
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /services/1
  def destroy
    @service.seo_meta.destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :title, :description, :picture_url, seo_meta_attributes: [:keywords, :description])
    end
end
