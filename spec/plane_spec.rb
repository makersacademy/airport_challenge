require 'plane'
require 'airport'



describe Plane do

  describe "#land" do
    it "should make planes land in the designated airport" do
      airport = Airport.new
      expect(subject.land(airport)).to eq "Plane has landed at #{airport}. "
    end
  end

  # describe "#take_off" do
  #   it "should make plans take off and leave airport" do
  #
  #   end
  # end


end
