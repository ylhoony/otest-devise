class SalesOrdersController < ApplicationController

  def index
    @sales_orders = SalesOrder.all
  end

  def new
    @sales_order = SalesOrder.new
    @transaction_lines = @sales_order.transaction_lines.build
  end

  def create
    @sales_order = SalesOrder.new(sales_order_params)
    if @sales_order.save
      redirect_to sales_order_path(@sales_order)
    else
      render :new
    end
  end

  def show
    @sales_order = SalesOrder.find(params[:id])
  end

  def edit
    @sales_order = SalesOrder.find(params[:id])
    @transaction_lines = @sales_order.transaction_lines
  end

  def update
    @sales_order = SalesOrder.find(params[:id])
    if @sales_order.update(sales_order_params)
      redirect_to sales_order_path(@sales_order)
    else
      render :edit
    end
  end

  def destroy
    @sales_order = SalesOrder.find(params[:id])
    @sales_order.delete
    redirect_to sales_orders_path
  end

  def change_status
    so = SalesOrder.find(params[:id])
    so.ship_so
    so.update(order_status_id: 3)
    redirect_to sales_order_path(so), notice: "Status is updated successfully."
  end

  private

    def sales_order_params
      params.require(:sales_order).permit(:company_address_id, :account_id, :account_address_id, :warehouse_id, :order_ref_number, :comment, :order_status_id,
        transaction_lines_attributes: [ :product_id, :comment, :unit_price, :quantity ])
    end

end
