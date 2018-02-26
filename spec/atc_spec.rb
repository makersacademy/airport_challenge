require './lib/atc'
require './lib/airport'
require './lib/plane'

describe ATC do
  atc = ATC.new
  airport = Airport.new
  plane1 = Plane.new(airport)

  # send instruction to plane to take off
  it 'sends instruction to a specified plane to take off' do
    expect(atc.instruct_take_off(plane1)).to be_an_instance_of(Array)
  end

end
