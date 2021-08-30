require 'airport'
require 'airplane'

describe 'User Stories' do

  it 'so an airplane can land, tell a airplane to land' do
    airport = Airport.new(10)
    airplane = Airplane.new
    expect { airport.land(airplane) }.not_to raise_error
  end

  it 'so an airplane can take off, tell the airplane to take off' do
    airport = Airport.new(10)
    airplane = Airplane.new 
    expect { airport.land(airplane) }.not_to raise_error
  end

  it 'airplane cannot land while airport is at max capacity' do 
    airport = Airport.new(10)
    airplane = Airplane.new
    10.times do
      airport.land(airplane)  
    end  
    expect { airport.land(airplane) }.to raise_error 'Airport full: Cannot land'  
  end
end 
     