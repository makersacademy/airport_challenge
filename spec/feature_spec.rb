require 'airport'
require 'plane'
require 'weather'

RSpec.describe 'Feature Test' do
  it 'instruct a plane to takeoff and check it\'s no longer in the airport' do
    allow(Weather).to receive(:current) { "safe" }

    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    airport.takeoff(plane)

    expect(airport.planes).not_to include plane
  end

  it 'planes should not take off when the weather is stormy' do 
    airport = Airport.new
    
    allow(Weather).to receive(:current) { "safe" }
    plane = Plane.new
    airport.land(plane)

    allow(Weather).to receive(:current) { "stormy" }
    expect { airport.takeoff(plane) }.to raise_error(Airport::TAKEOFF_ERROR_MESSAGE)
  end

  it 'prevent landing when the weather is stormy' do 
    airport = Airport.new
    
    allow(Weather).to receive(:current) { "stormy" }
    expect { airport.land(Plane.new) }.to raise_error(Airport::LANDING_ERROR_MESSAGE)
  end

  it 'prevent landing when airport is full' do 
    airport = Airport.new
    airport.capacity = 5
    
    allow(Weather).to receive(:current) { "safe" }

    airport.capacity.times { airport.land(Plane.new)
    }
    
    expect { airport.land(Plane.new) }.to raise_error(Airport::LANDING_ERROR_MESSAGE)
  end

  it 'set variable airport capacity' do 
    airport = Airport.new
    airport.capacity = 3

    expect(airport.capacity).to be 3
  end

  it 'allow landing multiple planes' do 
    airport = Airport.new

    allow(Weather).to receive(:current) { "safe" }
    airport.capacity = 3

    airport.capacity.times { airport.land(Plane.new) }
    
    expect(airport.planes.length).to be 3
  end

  it 'planes should only take of from airports they are in' do 
    
    airport = Airport.new
    plane = Plane.new
    allow(Weather).to receive(:current) { "safe" }
    expect { airport.takeoff(plane)}.to raise_error('Aircraft is not here')
  end

  it 'planes cannot land if already landed' do 
    
    airport = Airport.new
    plane = Plane.new
    allow(Weather).to receive(:current) { "safe" }
    airport.land(plane)
    expect { airport.land(plane)}.to raise_error('Aircraft has already landed')
  end
end
