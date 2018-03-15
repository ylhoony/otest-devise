module AccountAddressesHelper

  def supplier_addresses_list
    current_company.suppliers.map do |supplier|
      supplier.account_addresses
    end.flatten
  end

end
