class AccountContactsController < ApplicationController

  def index
    @account = Account.find(params[:customer_id] || params[:supplier_id])
    @account_contacts = @account.account_contacts
  end

  def new
    @account = Account.find(params[:customer_id] || params[:supplier_id])
    @account_contact= @account.account_contacts.build
  end

  def create
    @account = Account.find(params[:customer_id] || params[:supplier_id])
    @account_contact = @account.account_contacts.build(account_contact_params)
    if @account_contact.save
      redirect_to customer_account_contact_path(@account, @account_contact)
    else
      render :new
    end    
  end

  def show
    @account = Account.find(params[:customer_id] || params[:supplier_id])
    @account_contact = @account.account_contacts.find(params[:id])
  end

  def edit
    @account = Account.find(params[:customer_id] || params[:supplier_id])
    @account_contact = @account.account_contacts.find(params[:id])
  end

  def update
    @account = Account.find(params[:customer_id] || params[:supplier_id])
    @account_contact = @account.account_contacts.find(params[:id])
    if @account_contact.update(account_contact_params)
      redirect_to customer_account_contact_path(@account, @account_contact) if params[:customer_id]
      redirect_to supplier_account_contact_path(@account, @account_contact) if params[:supplier_id]
    else
      render :edit
    end  
  end

  def destroy
    account = Account.find(params[:customer_id] || params[:supplier_id])
    account_contact = account.account_contacts.find(params[:id])
    account_contact.delete
    redirect_to customer_path(account)
  end

  private

    def account_contact_params
      params.require(:account_contact).permit(:account_id, :first_name, :last_name, :job_title, :email, :phone, :mobile, :fax, :comment, :active)
    end

end
