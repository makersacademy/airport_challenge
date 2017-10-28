require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do
  describe '#land' do
    let ( :airport ) { Airport.new }
    it 'instructs a plane to land' do
      airport.conditions
      allow(airport.conditions).to receive('stormy')
      expect(airport.land).to eq("Plane landed safely")
    end

    it 'fails if weather is stormy' do
      allow(airport.conditions).to receive('stormy')
      expect(airport.land).to eq("Cannot land due to stormy weather")
    end
  end

  describe'#take_off' do
    let ( :airport ) { Airport.new }
    it 'allows plane to take off' do
      allow(airport.conditions).to receive('fine')
      expect(airport.take_off).to eq("Plane landed safely")
    end

    it 'fails if weather is stormy' do
      allow(airport.conditions).to receive('stormy')
      expect(airport.take_off).to eq("Cannot take off due to stormy weather")
    end
  end
end
