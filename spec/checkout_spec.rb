require "checkout"
require "item"
require "promotional_rules"

describe Checkout do
  let(:promo) { PromotionalRules.new }
  let(:item) { Item.new("001", "chair", 9.25) }
  let(:checkout) { Checkout.new(promo) }

  describe "checkout class" do
    it "checkout should be an instance of checkout" do
      expect(checkout.class).to eql(Checkout)
    end
  end

  describe "checkout scan" do
    it "@items should include item and item count" do
      expect(checkout.scan(item)).to eql({item => 1})
    end
  end

  describe "promo_rules class" do
    it "promo should be an instance of PromotionalRules" do
      expect(promo.class).to eql(PromotionalRules)
    end
  end

  describe "total with promotional_rules" do
    it "prices totalling £70 should give 10 percent discount" do
      expect(checkout.total).to eql(63.0)
    end
  end
end
