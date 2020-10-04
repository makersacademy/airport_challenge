require 'airport'
require 'plane'

describe Airport do
  it '#land lands a plane at an airport' do
    airport = Airport.new("London Airport")
    plane = Plane.new
    expect(airport.land(plane)).to include plane
  end

  it '#land does not land plane if airport capacity is full' do
    airport = Airport.new("London Airport")
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    plane4 = Plane.new
    airport.land(plane1)
    airport.land(plane2)
    airport.land(plane3)
    expect { airport.land(plane4) }.to raise_error(RuntimeError, 'airport full')
  end

  # describe "#release_bike" do
  #   it 'does not release a bike if there are none in the docking station' do
  #     docking_station = DockingStation.new
  #     expect { docking_station.release_bike }.to raise_error(RuntimeError, 'There are no bikes available')
  #   end
  #
  # end



  it '#depart departs a plane from an airport' do
    airport = Airport.new("London Airport")
    plane1 = Plane.new
    plane2 = Plane.new
    airport.land(plane1)
    airport.land(plane2)
    airport.depart(plane1)
    expect(airport.instance_variable_get(:@hangar).length).to eq 1
  end

  it '#depart confirms that a plane is no longer in the airport' do
    airport = Airport.new("London Airport")
    plane = Plane.new
    airport.land(plane)
    expect(airport.depart(plane)). to eq "Plane #{plane} has left London Airport"
  end

end
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
