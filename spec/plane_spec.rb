require 'plane'

describe Plane do
  subject(:plane) {described_class.new}

  describe "#land"do
    it "lands on the airport" do
      expect(subject).to respond_to(:land)
    end
  end

  describe "#take_off" do
    it "takes off from the airport" do
      expect(subject).to respond_to(:take_off)
    end
  end


end
