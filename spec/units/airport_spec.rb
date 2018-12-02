require 'Airport'

RSpec.describe Airport do
  describe '#land' do
    it 'instructs a plane to land' do
      weather = double('weather')
      allow(weather).to receive(:stormy?).and_return(false)
      airport = Airport.new(weather: weather)
      plane = double('a plane')

      expect(airport.land(plane)).to eq [plane]
    end
  end

  describe '#takeoff' do
    it 'instructs a plane to takeoff' do
      weather = double('weather')
      allow(weather).to receive(:stormy?).and_return(false)
      airport = Airport.new(weather: weather)
      plane = double('a plane')
      airport.land(plane)

      expect(airport.takeoff(plane)).to eq plane
    end
  end

  describe 'capacity' do
    it 'can be set when needed' do
      weather = double('weather')
      allow(weather).to receive(:stormy?).and_return(false)
      airport = Airport.new(capacity: 2, weather: weather)
      plane = double('a plane')

      expect(airport.land(plane)).to eq [plane]
    end

    it 'can be set when needed' do
      weather = double('weather')
      allow(weather).to receive(:stormy?).and_return(false)
      airport = Airport.new(capacity: 1, weather: weather)
      plane = double('a plane')
      airport.land(plane)

      expect { airport.land(plane) }.to raise_error('Airport full')
    end
  end

end
