require 'Airport'

describe Airport do
  it "responds to a land_plane method" do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it "responds to a plane_take_off method" do
    expect(subject).to respond_to :plane_take_off
  end

  it "responds to setting the capacity" do
    airport_5 = Airport.new(20)
    expect(airport_5.capacity).to eq 20
  end

  describe '#land_plane' do

    it "Adds the landed plane to a list of planes" do
      airport = Airport.new
      allow(airport).to receive(:generate_weather) { 'sunny' }
      plane = Plane.new
      airport.land_plane(plane)
      expect(airport.planes).to include(plane)
    end

    it "Raises an error when it tries to land a plane when stormy" do
      airport_3 = Airport.new
      allow(airport_3).to receive(:generate_weather) { 'stormy' }
      plane_3 = Plane.new
      expect { airport_3.land_plane(plane_3) }.to raise_error "Weather is stormy - "\
      "Cannot land plane"
    end

    it "Raises an error when it tries to land a plane when it is full" do
      airport_4 = Airport.new
      allow(airport_4).to receive(:generate_weather) { 'sunny' }
      plane_4 = Plane.new
      airport_4.capacity.times { airport_4.land_plane(plane_4) }
      expect { airport_4.land_plane(plane_4) }.to raise_error "Airport full"
    end
  end

  describe '#plane_take_off' do

    it "will remove plane from airport's stock of planes" do
      airport_2 = Airport.new
      allow(airport_2).to receive(:generate_weather) { 'sunny' }
      plane_2 = Plane.new
      airport_2.land_plane(plane_2)
      airport_2.plane_take_off(plane_2)
      expect(airport_2.planes).to eq []
    end

    it "Raises an error if weather is stormy" do
      airport_6 = Airport.new
      allow(airport_6).to receive(:generate_weather) { 'stormy' }
      plane_6 = Plane.new
      expect { airport_6.plane_take_off(plane_6) }.to raise_error "Weather is "\
        "stormy - cannot take off"
    end
  end
end
