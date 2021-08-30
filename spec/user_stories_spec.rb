require 'airport'
require 'airplane'

describe Airport do
  it 'so an airplane can land, tell a airplane to land' do
    airport = Airport.new
    airplane = Airplane.new
    expect { airport.land(airplane) }.not_to raise_error
  end

  it 'so an airplane can take off, tell the airplane to take off' do
    airport = Airport.new
    airplane = Airplane.new 
    expect { airport.land(airplane) }.not_to raise_error
  end
end  
