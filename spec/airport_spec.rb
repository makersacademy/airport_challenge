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
      airport.change_weather('sunny')
      plane = Plane.new
      airport.land_plane(plane)
      expect(airport.planes).to include(plane)
    end

    it "Raises an error when it tries to land a plane when stormy" do
      airport_3 = Airport.new
      airport_3.change_weather('stormy')
      plane_3 = Plane.new
      expect { airport_3.land_plane(plane_3) }.to raise_error "Weather is stormy - "\
      "Cannot land plane"
    end
  end

  describe '#plane_take_off' do

    it "will remove plane from airport's stock of planes" do
      airport_2 = Airport.new
      airport_2.change_weather('sunny')
      plane_2 = Plane.new
      airport_2.land_plane(plane_2)
      airport_2.plane_take_off(plane_2)
      expect(airport_2.planes).to eq []
    end
  end

end
