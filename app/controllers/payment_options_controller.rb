class PaymentOptionsController < ApplicationController
  # system_admin only
  before_action :require_signed_in?

  def index
    @payment_options = PaymentOption.all
  end

  def new
    @payment_option = PaymentOption.new
  end

  def create
    @payment_option = PaymentOption.new(payment_option_params)
    if @payment_option.save
      redirect_to payment_options_path
    else
      render :new
    end
  end

  def edit
    @payment_option = PaymentOption.find(params[:id])
  end

  def update
    @payment_option = PaymentOption.find(params[:id])
    if @payment_option.update(payment_option_params)
      redirect_to payment_options_path
    else
      render :edit
    end
  end

  def destroy
    @payment_option = PaymentOption.find(params[:id])
    if @payment_option.payment_terms.none?
      @payment_option.delete
      redirect_to payment_options_path
    else
      render :index, notice: "Please deactivate instead since there is other data related."
    end
  end

  def change_status
    payment_option = PaymentOption.find(params[:id])
    payment_option.active? ? payment_option.update(active: false) : payment_option.update(active: true)
    redirect_to payment_options_path, notice: "Status is updated successfully."
  end

  private

    def payment_option_params
      params.require(:payment_option).permit(:name, :active)
    end

end
