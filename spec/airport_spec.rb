require 'Airport'

describe Airport do

  it "responds to setting the capacity" do
    airport_5 = Airport.new(20)
    expect(airport_5.capacity).to eq 20
  end

  describe '#land_plane' do

    it "Adds the landed plane to a list of planes" do
      airport = Airport.new
      allow(airport).to receive(:generate_weather) { 'sunny' }
      plane = Plane.new
      plane.fly
      airport.land_plane(plane)
      expect(airport.planes).to include(plane)
    end

    it "Raises an error when it tries to land a plane when stormy" do
      airport_3 = Airport.new
      allow(airport_3).to receive(:generate_weather) { 'stormy' }
      plane_3 = Plane.new
      plane_3.fly
      expect { airport_3.land_plane(plane_3) }.to raise_error "Weather is stormy - "\
      "Cannot land plane"
    end

    it "Succesfully lands planes until airport is full" do
      airport_4 = Airport.new
      allow(airport_4).to receive(:generate_weather) { 'sunny' }
      airport_4.capacity.times do
        plane = Plane.new
        plane.fly
        airport_4.land_plane(plane)
      end
      plane_4 = Plane.new
      plane_4.fly
      expect { airport_4.land_plane(Plane.new) }.to raise_error "Airport full"
    end

    it "Raises error "

    it "Raises an error if tries to land a plan that is not flying" do
      airport_8 = Airport.new
      plane_8 = Plane.new
      allow(airport_8).to receive(:generate_weather) { 'sunny' }
      expect { airport_8.land_plane(plane_8) }.to raise_error "Plane not flying"
    end
  end

  describe '#plane_take_off' do

    it "will remove plane from airport's stock of planes" do
      airport_2 = Airport.new
      allow(airport_2).to receive(:generate_weather) { 'sunny' }
      plane_2 = Plane.new
      plane_2.fly
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

    it "Raises an error if plane already flying" do
      airport_7 = Airport.new
      allow(airport_7).to receive(:generate_weather) { 'sunny' }
      plane_7 = Plane.new
      plane_7.fly
      expect { airport_7.plane_take_off(plane_7) }.to raise_error "Plane "\
        "already flying"
    end
  end
end
