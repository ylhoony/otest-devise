class SuppliersController < ApplicationController
  before_action :require_signed_in?, :has_current_company?
  
  def index
    @suppliers = current_company.suppliers
  end

  def new
    @supplier = current_company.suppliers.build
  end

  def create
    @supplier = current_company.suppliers.build(supplier_params)
    if @supplier.save
      redirect_to supplier_path(@supplier), notice: "Created successfully."
    else
      render :new
    end
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update(supplier_params)
      redirect_to supplier_path(@supplier), notice: "Updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.delete
    redirect_to suppliers_path
  end

  private

    def supplier_params
      params.require(:supplier).permit(:name, :tax_id_number, :payment_term_id, :currency_id, :warehouse_id, :comment, :active)
    end

end