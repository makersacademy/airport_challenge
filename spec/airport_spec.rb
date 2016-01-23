require 'airport'
require 'weather'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  describe '#landing' do

    it 'instruct plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'confirm that plane has landed' do
      allow(plane).to receive(:land)
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
      allow(weather).to receive(:weather_conditions).and_return(5)
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.landed_planes).not_to include plane
    end

  end

  context 'bad weather' do

    it 'prevents take off when weather is stormy' do
      allow(weather).to receive(:weather_conditions).and_return(1)
      expect{airport.take_off(plane)}.to raise_error 'Cannot take off due to stormy weather'
    end

  end

end
