require './lib/atc'
require './lib/airport'
require './lib/plane'

describe Airport do
  atc = ATC.new
  airport = Airport.new
  plane1 = Plane.new(airport)

  # send instruction to plane to land at an airport
  it 'sends instruction to a specified plane to land at a specified airport' do
    #atc.instruct_land(plane1, airport)
    #airport.add_to_hangar(plane1)
    #expect(plane1).to be_an_instance_of(Array)
    expect(@hangar).to include(plane1)
  end

end
