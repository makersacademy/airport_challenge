require 'airport'
require 'plane'
require 'weather'

describe "Integrations" do
  describe Plane do
    it "is removed from an airports array of planes after taking off" do
      alpha = Plane.new
      bravo = Plane.new
      airport = Airport.new(50, [alpha, bravo])
      allow(airport).to receive(:current_weather).and_return('chill')
      bravo.take_off(airport)
      expect(airport.planes).not_to include(bravo)
      expect(airport.planes).to include(alpha)
    end
  end
end