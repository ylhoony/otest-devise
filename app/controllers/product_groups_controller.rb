class ProductGroupsController < ApplicationController
  before_action :require_signed_in?, :has_current_company?

  def index
    @product_groups = current_company.product_groups
  end

  def new
    @product_categories = ProductCategory.active_product_categories(current_company)
    @product_group = ProductGroup.new
  end

  def create
    @product_group = ProductGroup.new(product_group_params)
    if @product_group.save
      redirect_to product_groups_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    @product_categories = ProductCategory.active_product_categories(current_company)
    @product_group = ProductGroup.find(params[:id])
  end

  def update
    @product_group = ProductGroup.find(params[:id])
    if @product_group.update(product_group_params)
      redirect_to product_groups_path
    else
      render :edit
    end
  end

  def destroy
    product_group = ProductGroup.find(params[:id])
    product_group.delete
    redirect_to product_groups_path
  end

  def change_status
    product_group = ProductGroup.find(params[:id])
    product_group.active? ? product_group.update(active: false) : product_group.update(active: true)
    redirect_to product_groups_path, notice: "Status is updated successfully."
  end

  private

    def product_group_params
      params.require(:product_group).permit(:name, :company_id, :product_category_id, :active)
    end

end
