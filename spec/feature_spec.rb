require 'airport'
require 'plane'
require 'weather'

describe 'Feature Testing' do
  it 'can land and take off multiple aircrafts' do
    @airport = Airport.new(2)

    # create mulitple planes
    @plane1 = Plane.new
    @plane2 = Plane.new
    @plane3 = Plane.new

    # make two planes land
    allow(@airport).to receive(:sunny?).and_return(true)
    @airport.land(@plane1)
    @airport.land(@plane2)

    # two planes are succesfully parked in the airport
    expect(@airport.ramp.include? @plane1).to eq true
    expect(@airport.ramp.include? @plane2).to eq true

    # plane1 takes off and is no longer in the airport
    @airport.takeoff(@plane1)
    expect(@airport.ramp.include? @plane1).to be false

    # airport rejects if a plane tries to land twice
    expect { @airport.land(@plane2) } .to raise_error(RuntimeError, 'the plane has already parked in the airport')

    # airport rejects if a plane tries to take off if it's not parked
    expect { @airport.takeoff(@plane3) } .to raise_error(RuntimeError, 'the plane is not in the airport')

    # sucessfully lands a third aircraft
    @airport.land(@plane3)
    expect(@airport.ramp.include? @plane3).to be true
  end

  it 'can operate multiple airports' do
    # create multiple airports
    @airport1 = Airport.new
    @airport2 = Airport.new
    @airport3 = Airport.new

    # create multiple aircrafts
    @plane1 = Plane.new
    @plane2 = Plane.new
    @plane3 = Plane.new

    allow(@airport1).to receive(:sunny?).and_return(true)
    allow(@airport2).to receive(:sunny?).and_return(true)
    allow(@airport3).to receive(:sunny?).and_return(true)

    # new airport equals default capacity
    expect(@airport2.capacity).to eq Airport::DEFAULT_CAPACITY

    # make planes land in each airport
    @airport1.land(@plane1)
    @airport2.land(@plane2)
    @airport3.land(@plane3)

    # raises an error if a plane in an airport tries to land in another airport
    expect { @airport2.land(@plane3) } .to raise_error(RuntimeError, 'the plane is already parked in another airport')

    # make the plane in another airport take off in airport2
    expect { @airport2.takeoff(@plane1) } .to raise_error(RuntimeError, 'the plane is not in the airport')

    # plane can land in a different airport if it's not parked somewhere else
    @airport1.takeoff(@plane1)
    @airport2.takeoff(@plane2)
    @airport1.land(@plane2)
    @airport2.land(@plane1)
    expect(@airport2.ramp.include?@plane1).to be true
    expect(@airport1.ramp.include?@plane2).to be true
  end
end
