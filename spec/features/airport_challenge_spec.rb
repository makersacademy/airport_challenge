require 'airport'
require 'plane'
require 'weather'

RSpec.describe 'Airport Challenge' do

# Version 1
# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
#
# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  it 'can take off and land a number of planes' do
    weather = Weather.new
    allow(weather).to receive(:stormy?).and_return(false)

    heathrow = Airport.new(weather: weather)
    plane1 = Plane.new
    plane2 = Plane.new

    expect(heathrow.land(plane1)).to eq [plane1]
    expect(heathrow.land(plane2)).to eq [plane1, plane2]

    expect(heathrow.takeoff(plane1)).to eq plane1
    expect(heathrow.takeoff(plane2)).to eq plane2

    expect(heathrow.land(plane1)).to eq [plane1]

    # extended tests

    # - can't land a plane if already landed
    expect { heathrow.land(plane1) }.to raise_error('Already landed')

    # - can't takeoff a plane if it's already taken off
    expect { heathrow.takeoff(plane2) }.to raise_error('Plane not here')

    # - can't takeoff a plane from a different airport if it's landed in another
    gatwick = Airport.new(weather: weather)
    expect { gatwick.takeoff(plane1) }.to raise_error('Plane not here')
  end

# Version 2
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
#
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

  it 'can prevent landing at an airport with custom capacity' do
    weather = Weather.new
    allow(weather).to receive(:stormy?).and_return(false)
    la_guardia = Airport.new(capacity: 1, weather: weather)
    plane1 = Plane.new
    plane2 = Plane.new

    expect(la_guardia.land(plane1)).to eq [plane1]
    expect { la_guardia.land(plane2) }.to raise_error('Airport full')
  end

# Version 3
# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy

  it 'can prevent landing or taking off when the weather is stormy' do
    weather = Weather.new
    allow(weather).to receive(:stormy?).and_return(false)
    city_airport = Airport.new(weather: weather)
    plane1 = Plane.new
    plane2 = Plane.new
    city_airport.land(plane1)
    allow(weather).to receive(:stormy?).and_return(true)

    expect { city_airport.takeoff(plane1) }.to raise_error('Bad weather')
    expect { city_airport.land(plane2) }.to raise_error('Bad weather')
  end

end
