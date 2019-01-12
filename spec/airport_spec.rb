require 'airport'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
#
# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
#
# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
#
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

describe Airport do
  it 'can instruct a plane to land i.e. responds to land method' do
    expect(subject).to respond_to(:land)
  end
  it 'can store the landed instance of a plane in the airport for counting' do
    instance_of_plane = Plane.new
    subject.land(instance_of_plane)
    expect(subject.planes_in_airport).to include(instance_of_plane)
  end

  it 'can instruct a plane to take off, i.e. responds to takeoff method' do
    expect(subject).to respond_to(:take_off)
  end
  it 'can remove the taken-off instance of a plane from the airport after takeoff' do
    instance_of_plane = Plane.new
    subject.land(instance_of_plane)
    subject.take_off(instance_of_plane)
    expect(subject.planes_in_airport).not_to include(instance_of_plane)
  end

end
