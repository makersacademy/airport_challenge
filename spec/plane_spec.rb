require 'airport'
require 'weather'

describe Plane do
  subject(:airport) { Airport.new(weather) }
  subject(:plane) { Plane.new }
  subject(:weather) { Weather.new }

  it 'is initialized as airborne' do
    expect(plane).to be_airborne
  end

  context 'when plane has landed' do

    it 'is not airborne after landing' do
      airport.land(plane)
      expect(plane).not_to be_airborne
    end

  end

  context 'when plane is airborne' do

    it 'says it is airborne after take_off' do
      airport.land(plane)
      airport.take_off(plane)
      expect(plane).to be_airborne
    end

  end

end
