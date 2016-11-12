require 'air_controller'

describe AirportController do

it "should respond to the method land plane" do
  expect(subject).to respond_to (:land_plane)
end

it "land_plane should return an instance of a plane" do
  plane = Plane.new
  expect(subject.land_plane(plane)).to eq plane
end

it "should respond to the method take_off_plane" do
  expect(subject).to respond_to (:take_off_plane)
end

it "take off plane and expect confirm plane has taken off" do
  plane = subject.take_off_plane
  expect(plane.taken_off?).to eq true
end

it "should retrieve the planes from the airport/airport controller" do
  plane = Plane.new
  subject.land_plane(plane)
  expect(subject.planes).to eq plane
end

# it "landed planes should return true for landed?" do
#   plane = Plane.new
#   subject.land_plane(plane)
#   expect(plane.landed?).to eq true
# end

it "planes that have not landed should not return true for landed?" do
  plane = Plane.new
  expect(plane.landed?).to eq false
end



end
