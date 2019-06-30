require 'Airport'

describe Airport do
  
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it "responds to setting the capacity" do
    airport_new = Airport.new(20)
    expect(airport_new.capacity).to eq 20
  end

  describe '#land_plane' do

    it "Adds the landed plane to a list of planes" do
      allow(airport).to receive(:stormy?) { false }
      plane.fly
      airport.land_plane(plane)
      expect(airport.planes).to include(plane)
    end

    it "Raises an error when it tries to land a plane when stormy" do
      allow(airport).to receive(:stormy?) { true }
      plane.fly
      expect { airport.land_plane(plane) }.to raise_error "Weather is stormy - "\
      "Cannot land plane"
    end

    it "Succesfully lands planes until airport is full" do
      allow(airport).to receive(:stormy?) { false }
      airport.capacity.times do
        plane.fly
        airport.land_plane(plane)
      end
      plane.fly
      expect { airport.land_plane(plane) }.to raise_error "Airport full"
    end

    it "Raises an error if it tries to land a plane that is not flying" do
      allow(airport).to receive(:stormy?) { false }
      expect { airport.land_plane(plane) }.to raise_error "Plane not flying"
    end
  end

  describe '#plane_take_off' do

    it "will remove plane from airport's stock of planes" do
      allow(airport).to receive(:stormy?) { false }
      plane.fly
      airport.land_plane(plane)
      airport.plane_take_off(plane)
      expect(airport.planes).to eq []
    end

    it "Raises an error if weather is stormy" do
      allow(airport).to receive(:stormy?) { true }
      expect { airport.plane_take_off(plane) }.to raise_error "Weather is "\
        "stormy - cannot take off"
    end

    it "Raises an error if plane already flying" do
      allow(airport).to receive(:stormy?) { false }
      plane.fly
      expect { airport.plane_take_off(plane) }.to raise_error "Plane "\
        "already flying"
    end
  end
end
