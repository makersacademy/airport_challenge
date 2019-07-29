
require_relative '../lib/plane.rb'
require_relative '../lib/airport.rb'

describe Plane do
  it 'Checks that an instance of the plane class can be created and is actually an instance of the plan class' do
    new_plane = Plane.new("new_plane")
    expect( new_plane).to be_kind_of(Plane)
  end

  it 'Checks that the plane can land at the airport' do
    new_plane = Plane.new("new_plane")
    expect( new_plane).to respond_to(:land)
  end

  it 'Checks that a plane is added the the airports plane list once it has landed' do
    new_plane = Plane.new("new_plane")
    new_airport = Airport.new
    original_plane_count = new_airport.planes.count
    new_plane.land(new_airport)
    expect( new_airport.planes.count).to be > original_plane_count
  end

  it 'Checks that a plane is no longer in the airport once the take_off method has been called' do
    new_plane = Plane.new("new_plane")
    new_airport = Airport.new
    new_plane.land(new_airport)
    original_plane_count = new_airport.planes.count
    new_plane.take_off
    expect( new_airport.planes.count).to be < original_plane_count
  end

  it 'Checks that a plane cannot be landed when the Airports capacity has been reached' do
    airport = Airport.new
    plane1 = Plane.new("plane1")
    plane2 = Plane.new("plane2")
    airport.update_capacity(1)
    plane1.land(airport)
    expect{plane2.land(airport)}.to raise_error(RuntimeError)
  end

  it 'Checks that a plane cannot land when weather is stormy' do
    plane = Plane.new("plane")
    airport = Airport.new
    plane.weather?

  end

end



