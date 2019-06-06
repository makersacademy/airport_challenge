require 'airport'

describe Airport do
  it 'intructs a plane to land at airport' do
    airport = Airport.new
    plane = Plane.new
    expect(subject).to respond_to(:land).with(1).argument
  end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it 'so planes take off from airport, instruct a plane to take_off' do
    airport = Airport.new
    plane = Plane.new
    expect(airport). to respond_to(:take_off)
  end
end
