class ProductCategoriesController < ApplicationController
  before_action :require_signed_in?, :has_current_company?

  def index
    @product_categories = current_company.product_categories
  end

  def new
    @product_category = ProductCategory.new
  end

  def create
    @product_category = ProductCategory.new(product_category_params)
    if @product_category.save
      redirect_to product_categories_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    @product_category = ProductCategory.find(params[:id])
  end

  def update
    @product_category = ProductCategory.find(params[:id])
    if @product_category.update(product_category_params)
      redirect_to product_categories_path
    else
      render :edit
    end
  end

  def destroy
    product_category = ProductCategory.find(params[:id])
    product_category.delete
    redirect_to product_categories_path
  end

  def change_status
    product_category = ProductCategory.find(params[:id])
    product_category.active? ? product_category.update(active: false) : product_category.update(active: true)
    redirect_to product_categories_path, notice: "Status is updated successfully."
  end

  private

    def product_category_params
      params.require(:product_category).permit(:name, :company_id, :active, 
        product_groups_attributes: [:company_id, :name, :active ]
      )
    end


end
