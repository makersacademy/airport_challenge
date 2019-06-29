require 'Airport'

describe Airport do
  it "responds to a land_plane method" do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it "responds to a plane_take_off method" do
    expect(subject).to respond_to :plane_take_off
  end

  describe '#land_plane' do
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    it "Adds the landed plane to a list of planes" do
      expect(airport.planes).to include(plane)
    end
  end
end
