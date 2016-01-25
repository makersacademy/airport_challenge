require 'airport'

describe Airport do

  capacity = Airport::DEFAULT_CAPACITY

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#initialize' do
    it 'initializes with no planes and a capacity' do
      expect(airport.landed_planes).to eq([])
      expect(airport.capacity).to eq(capacity)
    end
  end

  describe '#land' do

    #This becomes redundant once .land is used elsewhere and can be deleted
    it 'instruct plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'confirm that plane has landed' do
      allow(airport).to receive(:weather_conditions).and_return(8)
      #allow(airport).to receive(:full?).and_return(false)
      airport.land(plane)
      expect(airport.landed_planes).to include plane
    end

  end

  describe '#take off' do

    it 'instruct plane to takeoff' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it 'confirm plane is no longer in the airport' do
      allow(airport).to receive(:weather_conditions).and_return(8)
      expect(airport.landed_planes).not_to include plane
    end

  end

  context 'bad weather' do

    before do
      allow(airport).to receive(:weather_conditions).and_return(1)
    end

    it 'prevents take off when weather is stormy' do
      message = 'Cannot take off due to stormy weather'
      expect{airport.take_off(plane)}.to raise_error message
    end

    it 'prevents landing when weather is stormy' do
      message = 'Cannot land due to stormy weather'
      expect{airport.land(plane)}.to raise_error message
    end

  end

  context 'full' do

    it 'prevents landing when airport is full' do
      allow(airport).to receive(:weather_conditions).and_return(8)
      capacity.times {airport.land(plane)}
      message = 'Runway is full, unable to land'
      expect{airport.land(plane)}.to raise_error message
    end

  end

end
