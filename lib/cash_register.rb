class CashRegister
 
  attr_accessor :total, :discount, :items
 
  
  def initialize (discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end 

  def add_item(title, price, quantity = 1)
    @last_price = price
    @last_quantity = quantity
    @total += price * quantity
    quantity.times do
      @items << title
    end
  end
  
  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total -= (@discount / 100.0) * @total 
      return "After the discount, the total comes to $#{@total.to_i}."
    end
  end 
  
  # We start with a discount of 20
  # > @discount == 20
  # Then we divide by 100.0 to get a decimal number
  # > @discount / 100.0 == 0.2
  # Next we multiply the discount by the decimal number
  # > 0.2 * 100 == 20
  # Finally we subtract the discount from the total
  # > @total -= 20 
  # > @total == 80
  
  def void_last_transaction
    @total -= @last_price * @last_quantity
  end   

end