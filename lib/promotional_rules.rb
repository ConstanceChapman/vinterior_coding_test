class PromotionalRules
  def promo1(total, number_of_chairs)
    if number_of_chairs && number_of_chairs > 2
      new_total = total - (9.25 * number_of_chairs)
      discount_total = new_total + (8.5 * number_of_chairs)
      return discount_total
    end
    return total
  end

  def promo2(total)
    total > 60 ? total * 0.9 : total
  end
end
