class MenuController < ApplicationController
  before_action :require_signed_in?, :has_current_company?

  def index
    redirect_to dashboard_path
  end

  def show_dashboard
    render "menu/dashboard"
  end

  def create_dashboard
    return redirect_to companies_path unless current_user.company_ids.include?(params[:id].to_i)
    current_user.current_company = Company.find(params[:id]) unless current_user.current_company.id === params[:id]
    render "menu/dashboard"
  end

  def demand
    
  end

  def supply
    
  end

  def product
    
  end

  def warehouse
    
  end

  def logistics
    
  end

  def setup
    
  end

  private

    def set_company
      current_user.current_company
    end
  
end