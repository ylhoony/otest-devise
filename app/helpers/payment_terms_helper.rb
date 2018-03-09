module PaymentTermsHelper

  def active_payment_terms_list
    PaymentTerm.active_payment_terms(current_company)
  end

end
