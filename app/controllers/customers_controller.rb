class CustomersController < ApplicationController
  before_action :require_signed_in?, :has_current_company?

  def index
    # binding.pry
    @customers = current_company.customers
  end

  def new
    @customer = current_company.customers.build
  end

  def create
    @customer = current_company.customers.build(customer_params)
    if @customer.save
      redirect_to customer_path(@customer), notice: "Created successfully."
    else
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    # binding.pry
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer), notice: "Updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.delete
    redirect_to customers_path
  end

  private

    def customer_params
      params.require(:customer).permit(:name, :tax_id_number, :payment_term_id, :currency_id, :warehouse_id, :comment, :active
        # ,
        # account_addresses_attributes: [
        #   :account_id, :company_name, :attention, :address_line_1, :address_line_2, :city, :state, :country_id, :phone, :fax, :comment, :active
        # ]
      )
    end

end

