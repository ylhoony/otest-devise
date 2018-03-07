class PaymentTermsController < ApplicationController
  before_action :require_signed_in?, :has_current_company?

  def index
    @payment_terms = current_company.payment_terms
  end

  def new
    @payment_term = PaymentTerm.new
    @payment_options = PaymentOption.where(active: true)
  end

  def create
    @payment_term = PaymentTerm.new(payment_term_params)
    if @payment_term.save
      redirect_to payment_terms_path
    else
      render :new
    end
  end

  def edit
    @payment_term = PaymentTerm.find(params[:id])
    @payment_options = PaymentOption.where(active: true)
  end

  def update
    @payment_term = PaymentTerm.find(params[:id])
    if @payment_term.update(payment_term_params)
      redirect_to payment_terms_path
    else
      render :edit
    end
  end

  def destroy
    payment_term = PaymentTerm.find(params[:id])
    if payment_term.delete
      redirect_to payment_terms_path
    else
      render :edit
    end
  end

  def change_status
    payment_term = PaymentTerm.find(params[:id])
    payment_term.active? ? payment_term.update(active: false) : payment_term.update(active: true)
    redirect_to payment_terms_path, notice: "Status is updated successfully."
  end

  private

    def payment_term_params
      params.require(:payment_term).permit(:name, :company_id, :trade_credit_percent, :trade_credit_days, :net_days, :payment_option_id, :active)
    end

end
