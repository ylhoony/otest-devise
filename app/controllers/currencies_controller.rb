class CurrenciesController < ApplicationController
  before_action :require_signed_in?

  def index
    @currencies = Currency.all
  end

  def new
    @currency = Currency.new    
  end

  def create
    @currency = Currency.new(currency_params)
    if @currency.save
      redirect_to currencies_path, notice: "Currency is created successfully."
    else
      render :new
    end
  end

  def edit
    @currency = Currency.find(params[:id])
  end

  def update
    @currency = Currency.find(params[:id])
    if @currency.update(currency_params)
      redirect_to currencies_path, notice: "Currency is updated successfully."
    else
      render :edit
    end
  end

  def change_status
    currency = Currency.find(params[:id])
    currency.active? ? currency.update(active: false) : currency.update(active: true)
    redirect_to currencies_path, notice: "Status is updated successfully."
  end

  private

    def currency_params
      params.require(:currency).permit(:name, :code_alpha, :code_numeric, :active)
    end

end
