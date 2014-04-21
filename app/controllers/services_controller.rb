class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  def index
    @services = Service.all
    fresh_when [@services, current_user], public: true
    @head_title       = I18n.t('.services.index.head_title')
    @meta_keywords    = I18n.t('.services.index.meta_keywords')
    @meta_description = I18n.t('.services.index.meta_description')
  end

  # GET /services/1
  def show
    @type_of_products = @service.type_of_products
    fresh_when [@service, @type_of_products, current_user], public: true
    @head_title = "ПСФ Строитель / Сервисы / #{@service.name}"
    @head_title       = I18n.t('.services.show.head_title',             title: @service.name)
    @meta_keywords    = I18n.t('.services.show.meta_keywords',       keywords: @service.seo_meta.keywords)
    @meta_description = I18n.t('.services.show.meta_description', description: @service.seo_meta.description)
  end

  # GET /services/new
  def new
    @service = Service.new seo_meta: SeoMeta.new
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
      if @service.update service_params
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /services/1
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url }
    end
  end

  private
    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:name, :title, :description, :picture_url, seo_meta_attributes: [:keywords, :description])
    end
end
