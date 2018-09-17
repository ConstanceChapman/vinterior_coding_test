class Checkout
  def initialize(promo_rules)
    @promo_rules = promo_rules
    @items = {}
  end

  def total(prices)
    @promo_rules ? "Discount!" : prices.reduce(:+)
  end
end
