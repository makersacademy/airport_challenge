require 'airport'
describe Airport do
  it 'creates an instance of Airport' do
    airport = Airport.new
    expect(airport).to be_instance_of(Airport)
  end
end

it 'can receive planes'do
plane = Plane.new
expect(airport.plane).to include plane
end
