require 'airport.rb'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }

  describe "#land" do
    it "should land plane at airport" do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq plane
    end
  end

end
