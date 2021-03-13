require 'airport'
require 'plane'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to :planes_at_airport }

  it 'has a default capacity' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#land' do
    it 'is expected to land planes' do
      allow(airport).to receive(:stormy_weather) { false }
      airport.land(plane)
      expect(airport.planes_at_airport).to include(plane)
    end

    it 'is expected to raise an error when the airport is full' do
      allow(airport).to receive(:stormy_weather) { false }
      airport.capacity.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error 'Airport full'
    end

    it 'prevents landing if the weather is stormy' do
      allow(airport).to receive(:stormy_weather) { true }
      expect { airport.land(plane) }.to raise_error 'The weather is too stormy'
    end

    it 'prevents planes to land if they are not flying' do
      allow(airport).to receive(:stormy_weather) { false }
      plane = Plane.new
      plane.flying = false
      expect { airport.land(plane) }.to raise_error 'Plane not flying'
    end

    it 'lets the aiport know that the plane is no longer flying' do
      allow(airport).to receive(:stormy_weather) { false }
      airport.land(plane)
      expect(plane.flying).to eq false
    end
  end

  describe '#take_off' do
    it 'is expected to take off planes' do
      allow(airport).to receive(:stormy_weather) { false }
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes_at_airport).to_not include(plane)
    end

    it 'is expected to confirm when a plane has taken off' do
      allow(airport).to receive(:stormy_weather) { false }
      airport.land(plane)
      expect(airport.take_off(plane)).to eq("Plane #{plane} has taken off.")
    end

    it 'prevents take-off if the weather is stormy' do
      allow(airport).to receive(:stormy_weather) { true }
      expect { airport.take_off(plane) }.to raise_error 'The weather is too stormy'
    end

    it 'prevents planes to take off if they are already flying' do
      allow(airport).to receive(:stormy_weather) { false }
      plane = Plane.new
      plane.flying = true
      expect { airport.take_off(plane) }.to raise_error 'Plane already flying'
    end

    it 'lets the aiport know that the plane in the air' do
      allow(airport).to receive(:stormy_weather) { false }
      airport.land(plane)
      airport.take_off(plane)
      expect(plane.flying).to eq true
    end

  #     # it 'only allows planes to take off if they are in the airport' do
  #     #     allow(airport).to receive(:stormy_weather) { false }
  #     #     expect(plane).to satisfy("be in airport") do |plane| airport.planes.include?(plane) end
  #     # end
  end

  it { is_expected.to respond_to :plane_state_change }

  describe '#plane_state_change' do
    before do
      allow(airport).to receive(:stormy_weather) { false }
    end

    it 'it changes the state of a plane to landed' do
      airport.plane_state_change(plane)
      expect(plane.flying).to eq false
    end
  end

  it { is_expected.to respond_to :stormy_weather }

end
