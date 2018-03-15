class CompanyAddressesController < ApplicationController

  def index
    @addresses = current_company.company_addresses
  end

  def new
    @address = CompanyAddress.new
  end

  def create
    @address = CompanyAddress.new(company_address_params)
    if @address.save
      redirect_to company_addresses_path
    else
      render :new
    end
  end

  def edit
    @address = CompanyAddress.find(params[:id])
  end

  def update
    @address = CompanyAddress.find(params[:id])
    if @address.update(company_address_params)
      redirect_to company_addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address = CompanyAddress.find(params[:id])
    @address.delete
    redirect_to company_addresses_path
  end

  private

    def company_address_params
      params.require(:company_address).permit(:company_id, :company_name, :attention, :address_line_1, :address_line_2, :city, :state, :country_id, :postal_code, :phone, :fax)
    end

end
