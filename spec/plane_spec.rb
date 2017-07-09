require 'plane'

describe Plane do

  let(:airport) { double('airport') }
  let(:plane) { Plane.new }
  let(:weather) { double('weather') }

  before(:example) do
    allow(airport).to receive(:port_plane)
    allow(weather).to receive(:stormy)
    allow(airport).to receive(:planes) { [] }
  end

  describe '#landed' do

    it 'returns true when a plane has landed' do
      allow(weather).to receive(:stormy) { false }
      subject.land(airport, weather)
      expect(subject.landed).to eq true
    end
  end

  describe '#land' do

    it 'fails if the plane is already grounded' do
      subject.land(airport, weather)
      expect { subject.land(airport, weather) }.
        to raise_error(RuntimeError, 'Cannot land. Plane is already grounded')
    end

    it 'does not allow landing in stormy conditions' do
      allow(weather).to receive(:stormy) { true }
      expect { plane.land(airport, weather) }.
        to raise_error(RuntimeError, 'Cannot land, adverse weather conditions')
    end

    it 'does not allow plane to land in full airport' do
      Airport::DEFAULT_CAPACITY.times { Plane.new.land(airport, weather) }
      # create array of default length below to mock behaviour / size of 'airport.planes'
      allow(airport).to receive(:planes) { Array.new(Airport::DEFAULT_CAPACITY) { 0 } }
      expect { plane.land(airport, weather) }.
        to raise_error(RuntimeError, 'Cannot land, airport is full')
    end

  end

  describe '#take_off' do

    before(:example) do
      allow(airport).to receive(:release_plane).with(plane)
      allow(airport).to receive(:planes) { [plane] }
    end

    it 'does not allow a plane already in the air to take off' do
      plane.take_off(airport)
      allow(airport).to receive(:planes) { [] }
      expect { plane.take_off(airport) }.
        to raise_error(RuntimeError, 'Cannot take off. Plane is already in the air')
    end

    it 'only allows takeoff from the airport the plane is in' do
      allow(airport).to receive(:planes) { [] }
      expect { plane.take_off(airport) }.
        to raise_error(RuntimeError, 'Cannot take off. Plane is not based at this airport')
    end

    it 'confirms the plane has taken off' do
      allow(weather).to receive(:stormy) { false }
      plane.take_off(airport, weather)
      expect(plane.landed).to eq false
    end

    it 'does not take off if weather is stormy' do
      allow(weather).to receive(:stormy) { true }
      expect { plane.take_off(airport, weather) }.
        to raise_error(RuntimeError, 'Cannot take off, adverse weather conditions')
    end

  end

end
