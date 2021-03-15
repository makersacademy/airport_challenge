require 'airport'
require 'plane'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it { is_expected.to respond_to :planes_at_airport }

  it 'has a default capacity' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it { is_expected.to respond_to :land }
  describe '#land with good weather' do
    before do
      allow(airport).to receive(:stormy_weather) { false }
    end

    it 'is expected to land planes' do
      airport.land(plane)
      expect(airport.planes_at_airport).to include(plane)
    end

    it 'is expected to raise an error when the airport is full' do
      airport.capacity.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error 'Airport full'
    end

    it 'prevents planes to land if they are not flying' do
      plane = Plane.new
      plane.flying = false
      expect { airport.land(plane) }.to raise_error 'Plane not flying'
    end

    it 'lets the aiport know that the plane is no longer flying' do
      airport.land(plane)
      expect(plane.flying).to eq false
    end
  end

  it { is_expected.to respond_to :take_off }
  describe '#take_off with good weather' do
    before do
      allow(airport).to receive(:stormy_weather) { false }
    end

    it 'is expected to take off planes' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes_at_airport).to_not include(plane)
    end

    it 'is expected to confirm when a plane has taken off' do
      airport.land(plane)
      expect(airport.take_off(plane)).to eq("Plane #{plane} has taken off.")
    end

    it 'prevents planes to take off if they are already flying' do
      plane = Plane.new
      plane.flying = true
      expect { airport.take_off(plane) }.to raise_error 'Plane already flying'
    end

    it 'lets the aiport know that the plane in the air' do
      airport.land(plane)
      airport.take_off(plane)
      expect(plane.flying).to eq true
    end
  end

  it { is_expected.to respond_to :stormy_weather }
  describe '#take_off and #land with bad weather' do
    before do
      allow(airport).to receive(:stormy_weather) { true }
    end

    it 'prevents take-off if the weather is stormy' do
      expect { airport.take_off(plane) }.to raise_error 'The weather is too stormy'
    end

    it 'prevents landing if the weather is stormy' do
      expect { airport.land(plane) }.to raise_error 'The weather is too stormy'
    end
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
end
