class Checkout
  attr_accessor :items
  def initialize(promo_rules)
    @promo_rules = promo_rules
    @items = {}
    @prices = [20, 20, 30]
  end

  def scan(item)
    @items[item] = @items[item] ? @items[item] + 1 : 1
    @prices << item.price
    return @items
  end

  def total
    basic_total = @prices.reduce(:+) ? @prices.reduce(:+) : 0
    promo1_total = @promo_rules.promo1(basic_total)
    return promo1_total
  end

end

# TODO this afternoon

# 3. create promo rules method and adapt total method
# 4. consider how to format promo_rules to adapt total rather than using boolean - hash of rules?
