class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  def index
    @services = Service.all
  end

  # GET /services/1
  def show
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
    if ( @service = Service.new(service_params) ).save
      redirect_to @service, notice: 'Service was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /services/1
  def update
    if @service.update service_params
      redirect_to @service, notice: 'Service was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /services/1
  def destroy
    @service.destroy
    redirect_to services_url
  end

  private
    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:name, :title, :description, :picture_url, seo_meta_attributes: [:keywords, :description])
    end
end
