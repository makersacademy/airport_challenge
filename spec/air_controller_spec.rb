require 'air_controller'

describe AirportController do

it "should respond to the method land plane" do
  expect(subject).to respond_to (:land_plane)
end

it "land_plane should return an instance of a plane" do

  expect(subject.land_plane).to eq Plane.new
end

#
# it "land plane method should return the plane that is landed" do
#   expect(subject.land_plane(plane)).to eq plane
# end

it "should respond to the method take_off_plane" do
  expect(subject).to respond_to (:take_off_plane)
end




end
