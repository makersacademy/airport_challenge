require 'airport'

describe Airport do

  describe 'it responds to land'
  it {is_expected.to respond_to :land}

  describe 'it responds to takeoff'
  it {is_expected.to respond_to :takeoff}

  describe 'it lands a plane'
  it {is_expected.to respond_to(:land).with(1).argument}

  describe 'it tells a plane to take off'
  it {is_expected.to respond_to(:takeoff).with(1).argument}

  airplane = Plane.new
  port = Airport.new




  describe 'whether plane has landed'
  port.land(airplane)
  it {expect(port::planes).to include airplane}


end

describe Airport do
airplane = Plane.new
port = Airport.new

describe 'it stores no more than 20 planes'
20.times {port.land(Plane.new)}
it {expect{port.land(airplane)}.to raise_error 'Cannot land, airport full' }
end

# describe 'dock gives an error when it is at capacity'
# 20.times {docking_station.dock(Bike.new)}
# it {expect {docking_station.dock(Bike.new)}.to raise_error("Dock is full")}
# SUNDAY MORNING
# how do you test for whether it can store and read an attirubte? Did you do this
#   with cycles, or did you just create the code? call.plane on it
