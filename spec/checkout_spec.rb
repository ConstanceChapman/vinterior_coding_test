require "checkout"
require "item"
require "promotional_rules"

describe Checkout do
  let(:promo) { PromotionalRules.new }
  let(:item) { Item.new("001", "chair", 9.25) }
  let(:co) { Checkout.new(true) }
  let(:ch) { Checkout.new(false)}
  let(:checkout) { Checkout.new(promo) }

  describe "checkout class" do
    it "co should be an instance of checkout" do
      expect(co.class).to eql(Checkout)
    end
  end

  describe "total method without discount" do
    it "total should be sum of prices" do
      expect(ch.total()).to eql(10)
    end
  end

  describe "total method with discount" do
    it "total should be dicounted" do
      expect(co.total()).to eql("Discount!")
    end
  end

  describe "scan method" do
    it "price should be added to prices array" do
      expect(co.scan(item)).to eql([10, 9.25])
    end
  end

  describe "promo_rules class" do
    it "promo should be an instance of PromotionalRules" do
      expect(promo.class).to eql(PromotionalRules)
    end
  end
end
