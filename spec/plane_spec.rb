require 'plane'

describe Plane do
  subject(:plane) {described_class.new}
  let(:airport) {Airport.new}

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

  # context "edge cases" do
  #    it "plane landed cannot land again" do
  #      allow(subject).to receive(:flying) {false}
  #      expect{plane.land}.to raise_error "Plane has already landed"
  #    end
  #  end

end
