require 'airport'

describe Airport do

  subject(:airport) { described_class.new(weather)}
  let(:weather) {double(:weather, stormy?: false)}
  let(:plane) { double(:plane, land: nil, take_off:nil) }

  describe 'initialization' do
    it 'has default capacity (if no capacity set at initialization)' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'sets capacity to argument passed' do
      airport = Airport.new(weather, 30)
      30.times {airport.land(plane)}
      expect{airport.land(plane)}.to raise_error 'Airport full'
    end
  end

  describe '#instruct_landing' do
    it 'instructs plane to land' do
      expect(plane).to receive(:land)
      airport.land(plane)
    end

    it 'has the plane after land' do
      expect(airport.land(plane)).to include plane
    end
  end

  describe '#takeoff' do
    before do
      airport.land(plane)
    end

    it 'instructs a plane to take off' do
      expect(plane).to receive(:take_off)
      airport.takeoff(plane)
    end

    it 'does not have plane after take off' do
      expect(airport.takeoff(plane)).not_to include plane
    end
  end

  context 'stormy' do
    it 'raises an error when plane tries to land in stormy weather' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.land(plane) }.to raise_error 'Stormy weather'
    end

    it 'raises an error when plane tries to take off in stormy weather' do
      airport.land(plane)
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.takeoff(plane) }.to raise_error 'Stormy weather'
    end
  end

  context 'inconsistent states' do
    it 'raises an error when airport capacity is full' do
      airport.capacity.times {airport.land(plane)}
      expect { airport.land(plane) }.to raise_error 'Airport full'
    end

    it 'raises an error when the plane is not in the airport' do
      expect { airport.takeoff(plane) }.to raise_error 'Plane not in airport'
    end
  end

end