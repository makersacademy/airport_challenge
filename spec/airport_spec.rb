require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#landing' do

    it 'instruct plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'confirm that plane has landed' do
      allow(plane).to receive(:land)
      allow(airport).to receive(:weather_conditions).and_return(8)
      airport.land(plane)
      expect(airport.landed_planes).to include plane
    end

  end

  describe '#take off' do

    it 'instruct plane to takeoff' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it 'confirm plane is no longer in the airport' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      allow(airport).to receive(:weather_conditions).and_return(8)
      expect(airport.landed_planes).not_to include plane
    end

  end

  context 'bad weather' do

    it 'prevents take off when weather is stormy' do
      allow(airport).to receive(:weather_conditions).and_return(1)
      message = 'Cannot take off due to stormy weather'
      expect{airport.take_off(plane)}.to raise_error message
    end

    it 'prevents landing when weather is stormy' do
      allow(airport).to receive(:weather_conditions).and_return(1)
      message = 'Cannot land due to stormy weather'
      expect{airport.land(plane)}.to raise_error message
    end

  end

end
