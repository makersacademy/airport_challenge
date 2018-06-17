require 'plane'

describe Plane do
  describe '#at_airport?' do
    it 'Checks if plane is at an airport after landing' do
      airport = Airport.new
      airport.weather = 'clear'
      airport.land(subject)
      expect(subject).to be_at_airport
    end

    it 'Checks if plane is not at an airport after takeoff' do
      airport = Airport.new
      airport.weather = 'clear'
      airport.land(subject)
      airport.takeoff(subject)
      expect(subject).not_to be_at_airport
    end
  end
end
