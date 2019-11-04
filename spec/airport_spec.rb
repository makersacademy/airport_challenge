require './lib/airport.rb'
describe Airport do
  it 'instructs a plane to land at airport' do
    plane = Plane.new
    airport = Airport.new
    expect(airport).to respond_to :land
  end
  it 'instructs plane to take off from an airport' do
    plane = Plane.new
    airport = Airport.new
    expect(airport).to respond_to :take_off
  end
  it 'confirms plane has left the airport' do
    airport = Airport.new
    expect(airport).to respond_to :confirm_plane_left
  end
  it 'prevents landing when airport is full' do
    plane = Plane.new
    expect(plane).to raise_error 'Prevent Landing - Airport is full'
  end
end
