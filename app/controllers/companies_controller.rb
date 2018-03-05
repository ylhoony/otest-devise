class CompaniesController < ApplicationController
  before_action :require_signed_in?

  def index
    @companies = current_user.companies
  end

  def new
    # form to create new company
    @company = Company.new
    @currencies = Currency.where(active: true)
    @countries = Country.where(active: true)
  end

  def create
    binding.pry
    @company = Company.new(company_params)
    if @company.save
      @company.employees.create(user_id: current_user.id)
      current_user.current_company = @company.id
      redirect_to dashboard_path
    else
      render :new
    end    
  end

  def show
    # show current_company information from company table (and relevant settings if available)


  end
  
  def edit
    # form to edit current_company information
    @company = Company.find_by(id: params[:id])
  end

  def destroy
    
  end

  private

    def company_params
      params.require(:company).permit(:name, :currency_id, :country_id, :active)
    end

end