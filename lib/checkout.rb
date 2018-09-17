require 'item'

class Checkout
  attr_accessor :items
  def initialize(promo_rules)
    @promo_rules = promo_rules
    @items = {}
    @prices = [10]
  end

  def scan(item)
    @items[item.code] = item
    @prices << item.price
    return @prices
  end

  def total()
    return @promo_rules ? "Discount!" : @prices.reduce(:+) if @prices
    return 0
  end
end

# TODO this afternoon
# 1. create item class
# 2. write method to extract array of prices
# 3. create promo rules method and adapt total method
# 4. consider how to format promo_rules to adapt total rather than using boolean - hash of rules?
