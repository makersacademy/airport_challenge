require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { instance_double("plane") }
  let(:other_plane) { instance_double("plane") }
  let(:weather) { airport.weather }

  describe '#initialize' do
    it 'initialises with a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'can be initialized with a custom capacity' do
      custom_capacity = 15
      expect(Airport.new(custom_capacity).capacity).to eq custom_capacity
    end
  end

  describe '#land' do
    before do
      allow(weather).to receive(:is_stormy?) { false }
    end

    it 'instructs a plane to land at the airport itself' do
      expect(plane).to receive(:land_at).with(airport)
      airport.land plane
    end

    it 'contains the landed plane' do
      allow(plane).to receive(:land_at).with(airport)
      airport.land plane
      expect(airport.planes).to include plane
    end
  end

  describe '#take_off' do
    before do
      allow(weather).to receive(:is_stormy?) { false }
      allow(plane).to receive(:land_at).with(airport)
      allow(plane).to receive(:landed?) { true }
      airport.land plane
    end

    it 'instructs a landed plane to take off from the airport' do
      expect(plane).to receive(:take_off)
      airport.take_off plane
    end

    it 'no longer contains a plane that was instructed to take off' do
      allow(plane).to receive(:take_off)
      airport.take_off plane
      expect(airport.planes).not_to include(plane)
    end

    it 'cannot launch planes not landed at this airport' do
      allow(other_plane).to receive(:landed?) { true }
      expect { airport.take_off other_plane }.to raise_error("Plane is not at this airport!")
    end
  end

  context 'airport is full' do
    before do
      Airport::DEFAULT_CAPACITY.times do
        allow(other_plane).to receive(:land_at).with(airport)
        allow(weather).to receive(:is_stormy?) { false }
        airport.land(other_plane)
      end
    end

    it 'does not allow planes to land' do
      allow(plane).to receive(:land_at).with(airport)
      expect { airport.land(plane) }.to raise_error("No space to land at this airport!")
    end
  end

  context 'stormy weather' do
    before do
      allow(weather).to receive(:is_stormy?) { false }
      allow(plane).to receive(:land_at).with(airport)
      allow(plane).to receive(:landed?) { true }
      airport.land(plane)
      allow(weather).to receive(:is_stormy?) { true }
    end

    it 'prevents take off' do
      allow(plane).to receive(:take_off)
      expect { airport.take_off(plane) }.to raise_error("Weather conditions not safe for take off!")
    end

    it 'prevents landing' do
      allow(plane).to receive(:land_at).with(airport)
      expect { airport.land(plane) }.to raise_error("Weather conditions not safe for landing!")
    end
  end

end
