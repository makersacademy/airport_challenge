require './lib/airport'

describe Airport do
  it 'responds to take off' do
    airport = Airport.new(20)
    expect(airport).to respond_to(:take_off)
  end

  it 'responds to landing' do
    airport = Airport.new(20)
    expect(airport).to respond_to(:landing)
  end 

  it 'does not allow planes to land when airport is full' do
    airport = Airport.new(20)
    plane = Plane.new
    20.times do
      airport.landing(plane)
    end 
    expect { airport.landing(plane) }.to raise_error "No free spots to land - Aiport Full"

  end
end 