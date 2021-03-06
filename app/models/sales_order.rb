class SalesOrder < AccountOrder  

  def transaction_lines_attributes=(trans_lines)
    trans_lines.map do |i, line|
      self.transaction_lines.build(line) unless line[:quantity].to_f === 0
    end
  end

  def ship_so
    # binding.pry
    self.transaction_lines.each do |line|
      # binding.pry
      inventory = Inventory.where("warehouse_id = ? AND product_id = ?", self.warehouse.id, line.product.id)[0]
      if inventory.present?
        inventory.update(quantity: inventory.quantity - line.quantity, total_value: inventory.total_value - inventory.total_value / inventory.quantity * line.quantity )
      else
        Inventory.create(company_id: self.account.company.id, product_id: line.product.id, warehouse_id: self.warehouse_id, quantity: -(line.quantity), total_value: self.total_value - self.total_value / self.quantity * line.quantity )
      end
    end
  end

end
