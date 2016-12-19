require "plane"

describe Plane do
  it {is_expected.to be_a(Object)}
  subject(:plane) {described_class.new}

  describe "#has_laded" do
    it "should change the state of landed to true" do
      expect{plane.has_landed}.to change{plane.landed}.from(false).to(true)
    end
  end
end
