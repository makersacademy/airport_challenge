# User Story 1 - Plane land
# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

require 'Plane'

RSpec.describe Plane do
it 'has the plane landed' do
  # arrange - create place to test
  my_plane = Plane.new()
  # act - what test is looking for
  actual = my_plane.plane_landed(true)
  # # assert - what to expect if test is true
  expect = landed == true 
end

# User Story 2 - Plane takeoff
# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

RSpec.describe Plane do
  it 'instruct plane to takeoff' do
    # arrange - create place to test
    plane = Plane.new()
    # act - what test is looking for
    actual = plane.landed(false)
    # # assert - what to expect if test is true
    expect = landed == false 
  end
end