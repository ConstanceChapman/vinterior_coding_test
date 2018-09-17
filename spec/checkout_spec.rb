require "checkout"
require "item"
require "promotional_rules"

describe Checkout do
  let(:promo) { PromotionalRules.new }
  let(:item) { Item.new("001", "chair", 9.25) }
  let(:item2) { Item.new("002", "table", 45) }
  let(:item3) { Item.new("003", "light", 19.95) }
  let(:checkout) { Checkout.new(promo) }
  let(:co) { Checkout.new(promo) }

  describe "checkout class" do
    it "checkout should be an instance of checkout" do
      expect(checkout.class).to eql(Checkout)
    end
  end

  describe "checkout scan" do
    it "@items should include item and item count and @prices should include price" do
      expect(checkout.scan(item)).to eql([{item.code => 1}, [item.price]])
    end
  end

  describe "promo_rules class" do
    it "promo should be an instance of PromotionalRules" do
      expect(promo.class).to eql(PromotionalRules)
    end
  end

  describe "total with first promotional_rule" do
    it "prices totalling £70 should give 10 percent discount" do
      checkout.prices = [20, 20, 30]
      expect(checkout.total).to eql(63.0)
    end
  end

  describe "total with second promotional_rule" do
    it "scanning three chairs, total should be £25.50" do
      checkout.items = {item.code => 3}
      checkout.prices = [9.25, 9.25, 9.25]
      expect(checkout.total).to eql(25.5)
    end
  end

  describe "total with both promotional_rules" do
    it "applying both promotions to £58.95" do
      checkout.items = {item.code => 3}
      checkout.prices = [9.25, 9.25, 9.25, 40]
      expect(checkout.total).to eql(58.95)
    end
  end

  describe "test data 1" do
    it "total price should be £66.78" do
      co.scan(item)
      co.scan(item2)
      co.scan(item3)
      expect(co.total).to eql(66.78)
    end
  end

  describe "test data 2" do
    it "total price should be £36.95" do
      co.scan(item)
      co.scan(item3)
      co.scan(item)
      expect(co.total).to eql(36.95)
    end
  end

  describe "test data 3" do
    it "total price should be £73.76" do
      co.scan(item)
      co.scan(item2)
      co.scan(item)
      co.scan(item3)
      expect(co.total).to eql(73.76)
    end
  end
end
