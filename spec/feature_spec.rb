require 'airport'
require 'plane'
require 'weather'

RSpec.describe 'Feature Test' do
  it 'instruct a plane to takeoff and check it\'s no longer in the airport' do
    allow(Weather).to receive(:current) { "safe" }

    airport = Airport.new
    airport.land(Plane.new)
    airport.takeoff

    expect(airport.plane).to eq nil
  end

  it 'shouldnt take off when the weather is stormy' do 
    airport = Airport.new
    
    allow(Weather).to receive(:current) { "safe" }
    airport.land(Plane.new)

    allow(Weather).to receive(:current) { "stormy" }
    expect { airport.takeoff }.to raise_error(Airport::TAKEOFF_ERROR_MESSAGE)
  end

  it 'should prevent landing when the weather is stormy' do 
    airport = Airport.new
    
    allow(Weather).to receive(:current) { "stormy" }
    expect { airport.land(Plane.new) }.to raise_error(Airport::LANDING_ERROR_MESSAGE)
  end

  it 'should prevent landing when airport is full' do 
    airport = Airport.new
    
    allow(Weather).to receive(:current) { "safe" }
    airport.land(Plane.new)
    
    expect { airport.land(Plane.new) }.to raise_error(Airport::LANDING_ERROR_MESSAGE)
  end

end
