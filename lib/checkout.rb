class Checkout
  attr_accessor :items, :prices
  def initialize(promo_rules)
    @promo_rules = promo_rules
    @items = {}
    @prices = []
  end

  def scan(item)
    @items[item.code] = @items[item.code] ? @items[item.code] + 1 : 1
    @prices << item.price
    return @items
  end

  def total
    basic_total = @prices.reduce(:+) ? @prices.reduce(:+) : 0
    return @promo_rules.promo(basic_total, @items)
  end

end

