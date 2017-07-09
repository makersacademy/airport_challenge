require 'plane'

describe Plane do

  let(:airport) { double('airport') }
  let(:plane) { Plane.new }
  let(:weather) { double('weather') }

  describe '#landed' do
    it 'returns true when a plane has landed' do
      allow(airport).to receive(:port_plane)
      allow(airport).to receive(:planes) { [] }
      allow(weather).to receive(:stormy) { false }
      subject.land(airport, weather)
      expect(subject.landed).to eq true
    end
  end

  describe '#land' do

    it 'fails if the plane is already grounded' do
      allow(airport).to receive(:port_plane)
      allow(airport).to receive(:planes) { [] }
      allow(weather).to receive(:stormy) { false }
      subject.land(airport, weather)
      expect { subject.land(airport, weather) }.to raise_error(RuntimeError)
    end

    it 'does not allow landing in stormy conditions' do
      allow(weather).to receive(:stormy) { true }
      expect { plane.land(airport, weather) }.to raise_error(RuntimeError)
    end

    it 'does not allow plane to land in full airport' do
      allow(weather).to receive(:stormy) { false }
      allow(airport).to receive(:planes) { [] }
      allow(airport).to receive(:port_plane)
      Airport::DEFAULT_CAPACITY.times { Plane.new.land(airport, weather) }
      # create array of default length below to mock size of 'airport.planes'
      allow(airport).to receive(:planes) { Array.new(Airport::DEFAULT_CAPACITY) { 0 } }
      expect { plane.land(airport, weather) }.to raise_error(RuntimeError)
    end

  end

  describe '#take_off' do

    it 'only allows takeoff from the airport the plane is in' do
      allow(airport).to receive(:planes) { [] }
      allow(airport).to receive(:release_plane).with(plane)
      expect { plane.take_off(airport) }.to raise_error(RuntimeError)
    end

    it 'confirms the plane has taken off' do
      allow(weather).to receive(:stormy) { false }
      allow(airport).to receive(:planes) { [plane] }
      allow(airport).to receive(:release_plane).with(plane)
      plane.take_off(airport, weather)
      expect(plane.landed).to eq false
    end

    it 'does not take off if weather is stormy' do
      allow(weather).to receive(:stormy) { true }
      allow(airport).to receive(:planes) { [plane] }
      expect { plane.take_off(airport, weather) }.to raise_error(RuntimeError)
    end

  end

end
