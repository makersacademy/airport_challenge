require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do
  it 'can create a new instance of the Airport class' do
    airport = Airport.new
    expect(airport).to be_a(Airport)
  end
 # Checks that instances of the Plane class can be stored
 # within an instance of the Airport class 
  it 'can instuct planes to land at an airport' do
  airport = Airport.new
  plane = Plane.new
  airport.land_plane(plane)
  expect(airport.planes.length).to eq 1
  end
  # Checks that instances of the Plane class can be
  # removed from instances of the Airport class
  it 'can instruct planes to take off' do
  airport = Airport.new
  plane = Plane.new
  airport.land_plane(plane)
  airport.take_off
  expect(airport.planes.length).to eq 0 
  end
  # Checks that when a plane takes off, that we
  # recieve confirmation it is no longer in the Airport
  it 'can confirm planes have left the airport' do
  airport = Airport.new
  plane = Plane.new
  airport.land_plane(plane)
  expect(airport.take_off).to eq "Flight has departed."
  end
end