require "plane.rb"

describe Plane do
it "should instruct a plane to land at the airport" do  # <--user story 1
  expect(subject).to respond_to(:land)
  end

it "should confirm that it is in the airport" do  # <--user story 1
  subject.land
  expect(subject.status_of_plane).to eq "in airport"
end

it "should instruct a plane to take off from an airport" do  # <--user story 2
  expect(subject).to respond_to(:take_off)
  end

it "should confirm that it is no longer in the airport" do  # <--user story 2
  subject.take_off
  expect(subject.status_of_plane).to eq "not in airport"

  end
end
