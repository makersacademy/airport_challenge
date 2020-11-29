require 'airport'
require 'plane'

describe Airport do
  let(:airport) { described_class.new }
  let(:plane) { Plane.new }
  it 'responds to land_plane' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it 'responds to take_off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'responds to plane_present? method' do
    expect(subject).to respond_to(:plane_present?).with(1).argument
  end

  it 'responds to capacity? method' do
    expect(subject).to respond_to(:capacity?)
  end

  it 'can be initialized with 1 argument for capacity' do
    expect(Airport).to respond_to(:new).with(1).argument
  end

  it 'responds to weather_generator method' do
    expect(subject).to respond_to(:weather_generator)
  end

  it 'responds to stormy? method' do
    expect(subject).to respond_to(:stormy?)
  end

  describe '#land_plane' do
    it 'stores plane in the airport' do
      allow(airport).to receive(:stormy?) { false }
      airport.land_plane(plane)
      expect(airport.hangar).to include(plane)
    end

    it 'changes plane status from flying to landed' do
      allow(airport).to receive(:stormy?) { false }
      airport.land_plane(plane)
      expect(plane.flying?).to eq false
    end

    it 'raises error when airport capacity is full' do
      allow(airport).to receive(:stormy?) { false }
      plane1 = Plane.new
      airport.capacity.times { airport.land_plane(plane) }
      expect { airport.land_plane(plane1) }.to raise_error 'hangar full'
    end

    it 'raises error when weather is stormy' do
      allow(airport).to receive(:stormy?) { true }
      expect { airport.land_plane(plane) }.to raise_error 'too stormy'
    end
  end

  describe '#take_off' do
    it 'removes plane from airport hangar' do
      allow(airport).to receive(:stormy?) { false }
      airport.land_plane(plane)
      airport.take_off(plane)
      expect(airport.hangar).not_to include(plane)
    end

    it 'changes status of plane from landed to flying' do
      allow(airport).to receive(:stormy?) { false }
      airport.land_plane(plane)
      airport.take_off(plane)
      expect(plane.flying?).to eq true
    end

    it 'raises error if the plane is not at the airport' do
      allow(airport).to receive(:stormy?) { false }
      plane1 = Plane.new
      airport.land_plane(plane)
      expect { airport.take_off(plane1) }.to raise_error 'plane not located here'
    end

    it 'raises error when weather is stormy' do
      allow(airport).to receive(:stormy?) { false }
      airport.land_plane(plane)
      allow(airport).to receive(:stormy?) { true }
      expect { airport.take_off(plane) }.to raise_error 'too stormy'
    end
  end

  describe '#plane_present?' do
    it 'verifies if a specific plane is in the hangar' do
      allow(airport).to receive(:stormy?) { false }
      airport.land_plane(plane)
      expect(airport.plane_present?(plane)).to eq true
    end
  end

  describe '#weather_generator' do
    it 'generates random weather type' do
      weather_types = ['sunny', 'stormy', 'cloudy', 'rainy', 'windy']
      expect(weather_types).to include(airport.weather_generator)
    end
  end

end
