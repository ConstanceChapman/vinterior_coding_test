require 'item'

class Checkout
  attr_accessor :items
  def initialize(promo_rules)
    @promo_rules = promo_rules
    @items = {}
    @prices = []
  end

  def scan(item)
    @items[item] = @items[item] ? @items[item] + 1 : 1
    @prices << item.price
    return @items
  end

end

# TODO this afternoon

# 3. create promo rules method and adapt total method
# 4. consider how to format promo_rules to adapt total rather than using boolean - hash of rules?
