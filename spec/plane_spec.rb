require 'plane'
require 'airport'



describe Plane do
let(:airport) {double Airport.new}

  describe "#land" do
    it "should make planes land in the designated airport" do
      expect(subject.land(airport, "sunny")).to eq "Plane has landed at #{airport}. "
    end

    it "should not land in stormy weather" do
      expect(subject.land(airport, "stormy")).to eq "Plane will not land due to stormy weather"
    end
  end

  describe "#take_off" do
    it "should make plans take off and leave airport" do
      expect(subject.take_off(airport, "sunny")).to eq "Plane has taken off and is no longer in #{airport}"
    end
  end

    it "should not take off when weather is stormy" do
      expect(subject.take_off(airport, "stormy")).to eq "Plane will not be taking off due to stormy weather"
    end
end
