module WarehousesHelper

  def active_warehouses_list
    Warehouse.active_warehouses(current_company)
  end

end
