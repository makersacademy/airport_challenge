require 'airport'
require 'plane'

describe Airport do

  let(:airport) { described_class.new }
  let(:plane) { Plane.new }

  context '#land_plane'

    it { is_expected.to respond_to(:land_plane).with(1).argument }

    it "accepts planes to land" do
      plane.land?
      expect{airport.land_plane(plane)}.to change{airport.plane_count}.by 1
    end



  context '#take_off'

    it "allows planes to take off" do
      plane.take_off
      expect{airport.take_off(plane)}.not_to raise_error
    end

    # it "gives a message confirming the plane has taken off"
    #   airport = Airport.new
    #   plane = Plane.new
    #   expect(airport.take_off).to eq ("the plane took off")
end
