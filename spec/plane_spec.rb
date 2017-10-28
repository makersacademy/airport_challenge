require 'plane'
require 'airport'



describe Plane do
let(:airport) {double Airport.new}

  describe "#land" do
    it "should make planes land in the designated airport" do
      expect(subject.land(airport)).to eq "Plane has landed at #{airport}. "
    end
  end

  describe "#take_off" do
    it "should make plans take off and leave airport" do
      expect(subject.take_off(airport)).to eq "Plane has taken off and is no longer in #{airport}"
    end
  end


end
