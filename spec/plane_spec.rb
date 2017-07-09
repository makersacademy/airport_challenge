require 'plane'


describe Plane do

  let(:airport) { double('airport') }
  let(:plane) { Plane.new }
  let(:weather) { double('weather') }

  describe '#landed' do
    it 'returns true when a plane has landed' do
      allow(airport).to receive(:port_plane)
      subject.land(airport)
      expect(subject.landed).to eq true
    end
  end

  describe '#take_off' do
    it 'does not take off if weather is stormy' do
      allow(weather).to receive(:stormy) { true }
      expect { plane.take_off(airport, weather) }.to raise_error(RuntimeError, 'Cannot take off, unsuitable weather conditions')
    end

  end

  describe '#take_off' do
    before(:example) do
      allow(weather).to receive(:stormy) { false }
      allow(airport).to receive(:release_plane)
      plane.take_off(airport, weather)
    end

    it 'confirms the plane has taken off' do
      expect(plane.landed).to eq false
    end

  end

end
