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



end
