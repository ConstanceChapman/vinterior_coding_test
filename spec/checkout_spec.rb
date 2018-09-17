require "checkout"

describe Checkout do
  let(:co) { Checkout.new(true) }

  describe "checkout class" do
    it "co should be an instance of checkout" do
      expect(co.class).to eql(Checkout)
    end
  end

  describe "initialize variables" do
    it "total should be sum of prices" do
      expect(co.total([1, 1, 1])).to eql(3)
    end
  end
end
