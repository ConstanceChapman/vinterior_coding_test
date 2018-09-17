require "checkout"

describe Checkout do
  let(:co) { Checkout.new(true) }

  describe "checkout class" do
    it "co should be an instance of checkout" do
      expect(co.class).to eql(Checkout)
    end
  end
end
