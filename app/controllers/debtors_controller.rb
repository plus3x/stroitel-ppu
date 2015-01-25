class DebtorsController < ApplicationController
  before_action :set_debtor, only: [:show, :edit, :update, :destroy]
  skip_before_action :set_public_proxy_refresh

  # GET /debtors
  def index
    @debtors = Debtor.all
  end

  # GET /debtors/1
  def show
  end

  # GET /debtors/new
  def new
    @debtor = Debtor.new
  end

  # GET /debtors/1/edit
  def edit
  end

  # POST /debtors
  def create
    if ( @debtor = Debtor.new(debtor_params) ).save
      redirect_to @debtor, notice: 'Debtor was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /debtors/1
  def update
    if @debtor.update debtor_params
      redirect_to @debtor, notice: 'Debtor was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /debtors/1
  def destroy
    @debtor.destroy
    redirect_to debtors_url
  end

  private

  def set_debtor
    @debtor = Debtor.find(params[:id])
  end

  def debtor_params
    params.require(:debtor).permit(:title, :content)
  end
end
