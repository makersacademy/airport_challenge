# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
#
require 'airport.rb'
require 'plane.rb'

describe Airport do

DEFAULT = 20

  let(:plane){Plane.new}
  let(:airport){Airport.new}

  it 'can add plane to an airport' do
    airport.add_plane(plane)
    expect(airport.hangar).to include(plane)
  end



# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  it 'can respond to a take off instruction' do
      airport.add_plane(plane)
      airport.release_plane
      expect(airport.hangar).not_to include(plane)
  end

  it 'can confirm plane is no longer in airport' do


  end
# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

it 'randomises the weather to see if it is stormy' do

  airport.weather
  expect(airport.weather).to eq("stormy" || "windy" || "rainy" || "sunny")
end
# it 'can stop takeoff when weather is stormy' do
#     airport.instruct_release(plane)
#     expect(airport.hangar).not_to include(plane)
# end

it 'stops the plane taking off if it is stormy' do
  airport.weather
  airport.stop_plane(plane)
  expect(airport.hangar).to include(plane)
end
# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy


it 'can stop landing when weather is stormy' do
  airport.weather
  airport.stop_landing(plane)
  expect(airport.hangar).not_to include(plane)
end
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
it 'prevents landing when the airport is full' do
  DEFAULT.times{airport.add_plane(plane)}
  expect{airport.add_plane(plane)}.to raise_error("the airport is full")
end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate
it "can have a default capacity" do
    DEFAULT.times{airport.add_plane(plane)}
  expect(airport.hangar.count).to eq(DEFAULT)
end

end
