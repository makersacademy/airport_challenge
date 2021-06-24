
describe 'user stories' do
  it 'so passengers can get to a desitination, instruct the plane to land at the airport' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error 
  end
end

