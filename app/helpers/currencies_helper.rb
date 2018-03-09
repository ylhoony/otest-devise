module CurrenciesHelper

  def active_currencies_list
    Currency.active_currencies
  end

end
