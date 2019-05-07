require 'plane'

describe Plane do

it 'tests the request to send to airport to take off' do
  plane = Plane.new
  plane.set_request("take off")
  expect(plane.requested).to eq "take off"
end

it 'tests the request to send to airport to land' do
  plane = Plane.new("flying")
  plane.set_request("land")
  expect(plane.requested).to eq "land"
end

it 'tests the request to send to airport to take off' do
  plane = Plane.new
  plane.set_request("land")
  expect(plane.requested).to eq "none"
end

it 'gets the valid request from the plane and send it to aiport' do
  plane = Plane.new
  plane.set_request("land")
  expect(plane.get_request).to eq "none"
end

it 'allows plane to change requested state' do
  plane = Plane.new
  plane.set_request("take off")
  plane.allow
  expect(plane.state).to eq "flying"
end

end
