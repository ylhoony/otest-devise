class PurchaseOrdersController < ApplicationController

  def index
    
  end

  def new
    @purchase_order = PurchaseOrder.new
  end

  def create
    # binding.pry
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    if @purchase_order.save
      redirect_to purchase_order_path(@purchase_order)
    else
      render :new
    end
  end

  def show
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  def edit
    
  end

  def destroy
    
  end

  private

    def purchase_order_params
      params.require(:purchase_order).permit(:company_address_id, :account_id, :account_address_id, :warehouse_id, :order_ref_number, :comment)
    end

end

