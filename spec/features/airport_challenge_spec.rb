require 'airport'
require 'plane'

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
    heathrow = Airport.new
    plane1 = Plane.new
    plane2 = Plane.new

    expect(heathrow.land(plane1)).to eq [plane1]
    expect(heathrow.land(plane2)).to eq [plane1, plane2]

    expect(heathrow.takeoff(plane1)).to eq plane1
    expect(heathrow.takeoff(plane2)).to eq plane2

    expect(heathrow.land(plane1)).to eq [plane1]
  end

# Version 2
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
#
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

# Version 3
# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy

end
