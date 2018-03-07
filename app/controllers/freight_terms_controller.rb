class FreightTermsController < ApplicationController
  before_action :require_signed_in?, :has_current_company?

  def index
    @freight_terms = current_company.freight_terms
  end

  def new
    @freight_term = FreightTerm.new
  end

  def create
    @freight_term = FreightTerm.new(freight_term_params)
    if @freight_term.save
      redirect_to freight_terms_path
    else
      render :new
    end
  end

  def edit
    @freight_term = FreightTerm.find(params[:id])
  end

  def update
    @freight_term = FreightTerm.find(params[:id])
    if @freight_term.update(freight_term_params)
      redirect_to freight_terms_path
    else
      render :edit
    end
  end

  def destroy
    freight_term = FreightTerm.find(params[:id])
    freight_term.delete
    redirect_to freight_terms_path
  end

  def change_status
    freight_term = FreightTerm.find(params[:id])
    freight_term.active? ? freight_term.update(active: false) : freight_term.update(active: true)
    redirect_to freight_terms_path, notice: "Status is updated successfully."
  end

  private
    def freight_term_params
      params.require(:freight_term).permit(:name, :company_id, :active)
    end

end
