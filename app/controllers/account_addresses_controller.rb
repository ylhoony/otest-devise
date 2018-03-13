class AccountAddressesController < ApplicationController

  def index
    @account = Account.find(params[:customer_id] || params[:supplier_id])
    @account_addresses = @account.account_addresses
  end

  def new
    @account = Account.find(params[:customer_id] || params[:supplier_id])
    @account_address = @account.account_addresses.build
  end

  def create
    @account = Account.find(params[:customer_id] || params[:supplier_id])
    @account_address = @account.account_addresses.build(account_address_params)
    if @account_address.save
      redirect_to customer_account_address_path(@account, @account_address)
    else
      render :new
    end    
  end

  def show
    @account = Account.find(params[:customer_id] || params[:supplier_id])
    @account_address = @account.account_addresses.find(params[:id])
  end

  def edit
    @account = Account.find(params[:customer_id] || params[:supplier_id])
    @account_address = @account.account_addresses.find(params[:id])
  end

  def update
    @account = Account.find(params[:customer_id] || params[:supplier_id])
    @account_address = @account.account_addresses.find(params[:id])
    if @account_address.update(account_address_params)
      redirect_to customer_account_address_path(@account, @account_address)
    else
      render :edit
    end  
  end

  def destroy
    @account = Account.find(params[:customer_id] || params[:supplier_id])
    account_address = account.account_addresses.find(params[:id])
    account_address.delete
    redirect_to customer_path(account)
  end

  private

    def account_address_params
      params.require(:account_address).permit(:account_id, :company_name, :attention, :address_line_1, :address_line_2, :city, :state, :country_id, :postal_code, :email, :phone, :fax, :comment, :active)
    end
    
end