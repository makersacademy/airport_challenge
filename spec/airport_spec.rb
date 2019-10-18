require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do
  it 'can create a new instance of the Airport class' do
    airport = Airport.new
    expect(airport).to be_a(Airport)
  end

  it 'can instuct planes to land at an airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    expect(airport.planes.length).to eq 1
    # Checks that instances of the Plane class can be stored
    # within an instance of the Airport class 
  end

  it 'can instruct planes to take off' do
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    airport.take_off
    expect(airport.planes.length).to eq 0
    # Checks that instances of the Plane class can be
    # removed from instances of the Airport class
  end
  
  it 'can confirm planes have left the airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land_plane(plane)
    expect(airport.take_off).to eq "Flight has departed."
    # Checks that when a Plane is removed from the Airport 
    # class, that we confirm it has left the Airport
  end

  it 'can check if weather is sunny or stormy' do
    airport = Airport.new
    expect(airport.check_weather).to eq ("Sunny" || "Stormy")
  end

  it 'can check that the weather checker is random' do
    airport = Airport.new
    expect(Kernel).to receive(:rand)
    airport.check_weather
  end
end