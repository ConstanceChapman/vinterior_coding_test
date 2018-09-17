class Checkout
  attr_accessor :items
  def initialize(promo_rules)
    @promo_rules = promo_rules
    @items = {}
  end

  def scan(item)
    @items[item[:code]] = item
    return @items
  end

  def total(prices)
    @promo_rules ? "Discount!" : prices.reduce(:+)
  end
end
