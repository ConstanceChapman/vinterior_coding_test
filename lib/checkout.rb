class Checkout
  def initialize(promo_rules)
    @promo_rules = promo_rules
    @items = {}
  end

  def total(prices)
    prices.reduce(:+)
  end
end
