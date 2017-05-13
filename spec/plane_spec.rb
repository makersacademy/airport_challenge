require "plane.rb"

describe Plane do
it "should instruct a plane to land at the airport" do
  expect(subject).to respond_to(:land)
  end

it "should confirm that it is in the airport" do
  subject.land
  expect(subject.status_of_plane).to eq "in airport"
end

it "should instruct a plane to take off from an airport" do
  expect(subject).to respond_to(:take_off)
  end

it "should confirm that it is no longer in the airport" do
  subject.take_off
  expect(subject.status_of_plane).to eq "not in airport"

  end
end
