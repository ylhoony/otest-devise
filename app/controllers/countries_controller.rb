class CountriesController < ApplicationController
  before_action :require_signed_in?

  def index
    @countries = Country.all
  end

  def new
    @country = Country.new    
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to countries_path
    else
      render :new, notice: "Country is created successfully."
    end
  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])
    if @country.update(country_params)
      redirect_to countries_path, notice: "Country is updated successfully."
    else
      render :edit
    end
  end

  def change_status
    country = Country.find(params[:id])
    country.active? ? country.update(active: false) : country.update(active: true)
    redirect_to countries_path, notice: "Status is updated successfully."
  end

  private

    def country_params
      params.require(:country).permit(:name, :alpha_2_code, :alpha_3_code, :numeric_code, :active)
    end

end
