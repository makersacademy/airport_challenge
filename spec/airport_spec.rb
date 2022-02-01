require './lib/airport'

describe Airport do
  it 'responds to plane_take_off' do
    airport = Airport.new(20)
    expect(airport).to respond_to(:plane_take_off)
  end

  it 'responds to plane_lands' do
    airport = Airport.new(20)
    expect(airport).to respond_to(:plane_land)
  end 

  it 'does not allow planes to land when airport is full' do
    airport = Airport.new(20)
    plane = Plane.new
    20.times do
      airport.plane_land(plane)
    end 
    expect { airport.plane_land(plane) }.to raise_error 'Can not land plane as airport is full '

  end
end 