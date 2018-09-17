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
    promo1_total = @promo_rules.promo1(basic_total, @items["001"])
    promo2_total = @promo_rules.promo2(promo1_total)
    return promo2_total
  end

end

