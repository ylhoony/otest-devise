class PurchaseOrdersController < ApplicationController

  def index
    @purchase_orders = PurchaseOrder.all
  end

  def new
    @purchase_order = PurchaseOrder.new
    @transaction_lines = @purchase_order.transaction_lines.build
  end

  def create
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
    @purchase_order = PurchaseOrder.find(params[:id])
    @transaction_lines = @purchase_order.transaction_lines
  end

  def update
    @purchase_order = PurchaseOrder.find(params[:id])
    if @purchase_order.update(purchase_order_params)
      redirect_to purchase_order_path(@purchase_order)
    else
      render :edit
    end
  end

  def destroy
    @purchase_order = PurchaseOrder.find(params[:id])
    @purchase_order.delete
    redirect_to purchase_orders_path
  end

  def change_status
    po = PurchaseOrder.find(params[:id])
    po.receive_po
    po.update(order_status_id: 2)
    redirect_to purchase_order_path(po), notice: "Status is updated successfully."
  end

  private

    def purchase_order_params
      params.require(:purchase_order).permit(:company_address_id, :account_id, :account_address_id, :warehouse_id, :order_ref_number, :comment, :order_status_id,
        transaction_lines_attributes: [ :product_id, :comment, :unit_price, :quantity ])
    end

end

