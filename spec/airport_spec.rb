require 'airport'
require 'plane'

describe Airport do
  it 'has a default capacity of 3' do
    expect(Airport::AIRPORT_CAPACITY).to eq 3
  end

  it 'has a variable capacity' do
    airport = Airport.new("London Airport", 30)
    airport.stub(:airport_weather).and_return('sunny')
    plane = Plane.new

    30.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error(RuntimeError, "You can't land. London Airport's hangar is full.")
  end

  it '#land lands a plane at an airport' do
    airport = Airport.new("London Airport")
    airport.stub(:airport_weather).and_return('sunny')
    plane = Plane.new
    expect(airport.land(plane)).to include plane
  end

  it '#land does not land plane if airport capacity is full' do

    airport = Airport.new("London Airport")
    airport.stub(:airport_weather).and_return('sunny')
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    plane4 = Plane.new
    airport.land(plane1)
    airport.land(plane2)
    airport.land(plane3)
    expect { airport.land(plane4) }.to raise_error(RuntimeError, "You can't land. London Airport's hangar is full.")
  end

  it '#depart departs a plane from an airport' do
    airport = Airport.new("London Airport")
    airport.stub(:airport_weather).and_return('sunny')
    plane1 = Plane.new
    plane2 = Plane.new
    airport.land(plane1)
    airport.land(plane2)
    airport.depart(plane1)
    expect(airport.instance_variable_get(:@hangar).length).to eq 1
  end

  it '#depart confirms that a plane is no longer in the airport' do
    airport = Airport.new("London Airport")
    airport.stub(:airport_weather).and_return('sunny')
    plane = Plane.new
    airport.land(plane)
    expect(airport.depart(plane)).to eq "Plane #{plane} has left London Airport"
  end

  it '#airport_weather can be sunny' do
    airport = Airport.new("London Airport")
    airport.stub(:airport_weather).and_return('sunny')
    expect(airport.airport_weather).to eq 'sunny'
  end

  it '#airport_weather can be stormy' do
    airport = Airport.new("London Airport")
    airport.stub(:airport_weather).and_return('stormy')
    expect(airport.airport_weather).to eq 'stormy'
  end
end
