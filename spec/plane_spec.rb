require 'plane'

describe Plane do

  let(:airport) { double('airport') }
  let(:plane) { Plane.new }
  let(:weather) { double('weather') }

  describe '#landed' do
    it 'returns true when a plane has landed' do
      allow(airport).to receive(:port_plane)
      allow(airport).to receive(:plane) { nil }
      subject.land(airport)
      expect(subject.landed).to eq true
    end
  end

  describe '#land' do

    it 'does not allow landing in stormy conditions' do
      allow(weather).to receive(:stormy) { true }
      expect { plane.land(airport, weather) }.to raise_error(RuntimeError)
    end

    it 'does not allow plane to land in full airport' do
      allow(weather).to receive(:stormy) { false }
      allow(airport).to receive(:plane) { plane }
      allow(airport).to receive(:port_plane)
      expect { plane.land(airport, weather) }.to raise_error(RuntimeError)
    end

  end

  describe '#take_off' do

    it 'confirms the plane has taken off' do
      allow(weather).to receive(:stormy) { false }
      allow(airport).to receive(:release_plane)
      plane.take_off(airport, weather)
      expect(plane.landed).to eq false
    end

    it 'does not take off if weather is stormy' do
      allow(weather).to receive(:stormy) { true }
      expect { plane.take_off(airport, weather) }.to raise_error(RuntimeError)
    end

  end

end
