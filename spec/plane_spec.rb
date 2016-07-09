require 'plane'

describe Plane do

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off}
  it { is_expected.to respond_to :landed}

  describe '#land' do

    it 'raises an error when plane is not in flight' do
      plane = Plane.new
      weather = Weather.new
      airport = Airport.new
      allow(weather).to receive(:stormy?) { false }
      plane.land(airport, weather)
      expect { plane.land(airport) }.to raise_error 'Plane is not in flight'
    end

    it 'raises an error when weather is stormy' do
      plane = Plane.new
      weather = Weather.new
      airport = Airport.new
      allow(weather).to receive(:stormy?) { true }
      expect { plane.land(airport, weather) }.to raise_error 'Too stormy to land'
    end

    it 'raises an error if airport is full' do
      plane1 = Plane.new
      plane2 = Plane.new
      weather = Weather.new
      airport = Airport.new 1
      allow(weather).to receive(:stormy?) { false }
      plane1.land(airport, weather)
      expect { plane2.land(airport, weather) }.to raise_error 'Airport is too full to land'
    end

    it 'changes plane to landed status' do
      plane = Plane.new
      weather = Weather.new
      airport = Airport.new
      allow(weather).to receive(:stormy?) { false }
      plane.land(airport, weather)
      expect(plane.landed).to eq true
    end

    it 'adds the plane to the airport' do
      plane = Plane.new
      weather = Weather.new
      airport = Airport.new
      allow(weather).to receive(:stormy?) { false }
      plane.land(airport, weather)
      expect(airport.planes.include?(plane)).to eq true
    end

  end

  describe '#take_off' do

    it 'raises an error when plane is already in flight' do
      airport = Airport.new
      expect { subject.take_off(airport)}.to raise_error 'Plane is already in flight'
    end

    it 'raises an error when weather is stormy' do
      plane = Plane.new
      weather = Weather.new
      airport = Airport.new
      allow(weather).to receive(:stormy?) { false }
      plane.land(airport, weather)
      allow(weather).to receive(:stormy?) { true }
      expect { plane.take_off(airport, weather) }.to raise_error 'Too stormy to take off'
    end

    it 'raises an error if plane is not at the given airport' do
      plane = Plane.new
      weather = Weather.new
      airport = Airport.new
      airport2 = Airport.new
      allow(weather).to receive(:stormy?) { false }
      plane.land(airport, weather)
      expect { plane.take_off(airport2, weather) }.to raise_error 'Plane is not at given airport'
    end

    it 'changes plane to not landed status' do
      plane = Plane.new
      weather = Weather.new
      airport = Airport.new
      allow(weather).to receive(:stormy?) { false }
      plane.land(airport, weather)
      plane.take_off(airport, weather)
      expect(plane.landed).to eq false
    end

    it 'removes the plane from the airport' do
      plane = Plane.new
      weather = Weather.new
      airport = Airport.new
      allow(weather).to receive(:stormy?) { false }
      plane.land(airport, weather)
      plane.take_off(airport, weather)
      expect(airport.planes.include?(plane)).to eq false
    end

  end

end
