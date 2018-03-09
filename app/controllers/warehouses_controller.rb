class WarehousesController < ApplicationController
  before_action :require_signed_in?, :has_current_company?

  def index
    @warehouses = current_company.warehouses
  end

  def new
    @countries = Country.active_countries
    @warehouse = current_company.warehouses.build
  end

  def create
    @warehouse = current_company.warehouses.build(warehouse_params)
    if @warehouse.save
      redirect_to warehouse_path(@warehouse)
    else
      render :new
    end
  end

  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def edit
    @warehouse = Warehouse.find(params[:id])
  end

  def update
    @warehouse = Warehouse.find(params[:id])
    if @warehouse.update(warehouse_params)
      redirect_to warehouse_path(@warehouse), notice: "Updated successfully."
    else
      render :edit
    end
  end

  def destroy
    warehouse = Warehouse.find(params[:id])
    warehouse.delete
    redirect_to warehouses_path
  end

  def change_status
    warehouse = Warehouse.find(params[:id])
    warehouse.active? ? warehouse.update(active: false) : warehouse.update(active: true)
    redirect_to warehouses_path, notice: "Status is updated successfully."
  end

  private

    def warehouse_params
      params.require(:warehouse).permit(:name, :attention, :address_line_1, :address_line_2, :city, :state, :country_id, :postal_code, :email, :phone, :fax, :active)
    end

end
