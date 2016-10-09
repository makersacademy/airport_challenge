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

  context "edge cases" do
      it "raises error when landed plane wants to land again" do
       allow(subject).to receive(:flying) {false}
       expect{plane.land}.to raise_error "Plane has already landed"
      end

      it "raises error when flying plane wants to take off" do
        allow(subject).to receive(:flying) {true}
        expect{plane.take_off}.to raise_error "Plane is not in the airport"
      end
   end

end
