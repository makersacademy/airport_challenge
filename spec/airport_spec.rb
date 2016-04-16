require 'airport'

describe Airport do

let(:weather) {double(:weather, stormy?: false)}
let(:airport) { described_class.new(50, weather)}
let(:plane) { double(:plane, land: nil, take_off: nil, flying?: nil) }


  describe 'initialization' do
    it 'has default capacity (if no capacity set at initialization)' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'sets capacity to argument passed' do
      airport = Airport.new(30, weather)
      30.times {airport.land(plane)}
      expect{airport.land(plane)}.to raise_error 'Airport full'
    end
  end

  it 'changes capacity of airport' do
    airport.capacity = 52
    52.times {airport.land(plane)}
    expect{airport.land(plane)}.to raise_error 'Airport full'
  end

  describe '#takeoff' do
    it 'responds to takeoff' do
      expect(airport).to respond_to :takeoff
    end

    it 'instructs a plane to take off' do
      plane_double = double :plane
      airport.land(plane_double)
      expect(airport.takeoff).to eq plane_double
    end

    it 'raises an error when there are no planes to take off' do
      expect { airport.takeoff }.to raise_error 'No planes in airport'
    end

    it 'raises an error when plane tries to take off in stormy weather' do
      airport.land(plane)
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.takeoff }.to raise_error 'Stormy weather'
    end
  end

  describe '#instruct_landing' do
    it {is_expected.to respond_to(:land).with(1).argument}

    it 'instructs a plane to land' do
      expect(airport.land(plane)).to include plane
    end

    it 'raises an error when airport capacity is full' do
      airport.capacity.times {airport.land(plane)}
      expect { airport.land(plane) }.to raise_error 'Airport full'
    end

    it 'raises an error when plane tries to land in stormy weather' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.land(plane) }.to raise_error 'Stormy weather'
    end
  end

end