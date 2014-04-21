class DebtorsController < ApplicationController
  before_action :set_debtor, only: [:show, :edit, :update, :destroy]

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
    @debtor = Debtor.new(debtor_params)

    respond_to do |format|
      if @debtor.save
        format.html { redirect_to @debtor, notice: 'Debtor was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /debtors/1
  def update
    respond_to do |format|
      if @debtor.update(debtor_params)
        format.html { redirect_to @debtor, notice: 'Debtor was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /debtors/1
  def destroy
    @debtor.destroy
    respond_to do |format|
      format.html { redirect_to debtors_url }
    end
  end

  private
    def set_debtor
      @debtor = Debtor.find(params[:id])
    end

    def debtor_params
      params.require(:debtor).permit(:title, :content)
    end
end
