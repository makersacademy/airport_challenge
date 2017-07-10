require 'airport'

describe Airport do
  let(:airport) { described_class.new("London Heathrow") }
  let(:weather) { double(:weather, :stormy? => false) }
  let(:plane)   { double(:plane) }

  describe '#add_plane' do
    it 'can keep track of planes that have landed' do
      planes = []
      3.times do
        plane = double(:plane)
        airport.add_plane(plane)
        planes << plane
      end
      expect(airport.planes).to eq planes
    end

    it 'does not allow plane to land when full' do
      airport.capacity.times do
        plane = Plane.new
        airport.add_plane(plane)
      end
      expect { airport.add_plane(plane) }.to raise_error "Cannot land, airport is full"
    end

  end

  describe '#delete_plane' do
    it 'can keep track of planes that have taken off' do
      planes = []
      3.times do
        plane = double(:plane)
        airport.add_plane(plane)
        planes << plane
      end
      airport.delete_plane(planes.shift)
      expect(airport.planes).to eq planes
    end
  end

  describe '#new' do

    it 'must have a name' do
      expect { Airport.new }.to raise_error ArgumentError
    end

    it 'can be named when created' do
      airport = Airport.new("London Gatwick")
      expect(airport.name).to eq "London Gatwick"
    end

    it 'has a weather' do
      airport = Airport.new("London Heathrow", weather)
      expect(airport.weather.stormy?).to eq false
    end

    it 'has a capacity' do
      expect(airport.capacity).to eq DEFAULT_CAPACITY
    end

    it 'can be be set to a different capacity' do
      airport = Airport.new("London Heathrow", nil, 10)
      expect(airport.capacity).to eq 10
    end

  end
end
