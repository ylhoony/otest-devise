class ProductsController < ApplicationController
  before_action :require_signed_in?, :has_current_company?

  def index
    @products = Product.all
  end

  def new
    @product_types = ProductType.all
    @product_groups = ProductGroup.all
    @unit_of_measures = UnitOfMeasure.all
    @product = Product.new
  end

  def create
    @product_types = ProductType.all
    @product_groups = ProductGroup.all
    @unit_of_measures = UnitOfMeasure.all
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product_types = ProductType.all
    @product_groups = ProductGroup.all
    @unit_of_measures = UnitOfMeasure.all
    @product = Product.find(params[:id])
  end

  def update
    # binding.pry
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    binding.pry
    product = Product.find(params[:id])
    product.delete
    redirect_to products_path
  end

  private

    def product_params
      params.require(:product).permit(:company_id, :product_type_id, :product_group_id, :sku, :name, :unit_of_measure_id, :price)
    end

end
