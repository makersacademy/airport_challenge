describe 'user_stories' do
    # As an air traffic controller 
    # So I can get passengers to a destination 
    # I want to instruct a plane to land at an airport
  it 'planes land at airport, instruct plane to land' do
    airport = Airport.new # Airport will give instructions to plane
    plane = Plane.new     # Plane gets instructions from airport and executes
    expect { airport.land(plane) }.not_to raise_error # method 'land on 'airport with argument 'plane
  end

end
