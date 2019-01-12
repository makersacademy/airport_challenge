require 'airport'
require 'plane'
require 'weather'

RSpec.describe 'Feature Test' do
  it 'instruct a plane to takeoff check it\'s no longer in the airport' do
    airport = Airport.new
    airport.land(Plane.new)

    allow(Weather).to receive(:current) { "safe" }

    airport.takeoff

    expect(airport.plane).to eq nil
  end

  it 'shouldnt take off when the weather is stormy' do 
    airport = Airport.new
    airport.land(Plane.new)
    
    allow(Weather).to receive(:current) { "stormy" }
    
    error_message = 'You cannot take off'
    expect { airport.takeoff }.to raise_error(error_message)
  end
end
