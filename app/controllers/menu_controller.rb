class MenuController < ApplicationController
  before_action :require_signed_in?

  def index
    redirect_to companies_path if user_signed_in?
  end

  def dashboard
    
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
  
end