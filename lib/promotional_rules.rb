class PromotionalRules
  def promo1(total)
    total > 60 ? total * 0.9 : total
  end

  def promo2(number_of_chairs)
    number_of_chairs > 2 ? 8.5 * number_of_chairs : 9.25 * number_of_chairs
  end
end
