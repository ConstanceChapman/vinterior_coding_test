require "checkout"

describe Checkout do
  let(:co) { Checkout.new(true) }
  let(:ch) { Checkout.new(false)}

  describe "checkout class" do
    it "co should be an instance of checkout" do
      expect(co.class).to eql(Checkout)
    end
  end

  describe "total method without discount" do
    it "total should be sum of prices" do
      expect(ch.total([1, 1, 1])).to eql(3)
    end
  end

  describe "total method with discount" do
    it "total should be dicounted" do
      expect(co.total([1, 1, 1])).to eql("Discount!")
    end
  end

  describe "scan method" do
    it "item should be added to @items hash" do
      expect(co.scan({code: 001, name: "chair", price: 9.25})).to eql({ 001 => {code: 001, name: "chair", price: 9.25}})
    end
  end
end
