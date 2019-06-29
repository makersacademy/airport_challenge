require 'Airport'

describe Airport do
  it "responds to a land_plane method" do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it "responds to a plane_take_off method" do
    expect(subject).to respond_to :plane_take_off
  end

  describe '#land_plane' do

    it "Adds the landed plane to a list of planes" do
      airport = Airport.new
      plane = Plane.new
      airport.land_plane(plane)
      expect(airport.planes).to include(plane)
    end
  end

  describe '#plane_take_off' do

    it "will remove plane from airport's stock of planes" do
      airport_2 = Airport.new
      plane_2 = Plane.new
      airport_2.land_plane(plane_2)
      airport_2.plane_take_off(plane_2)
      expect(airport_2.planes).to eq []
    end
  end

end
