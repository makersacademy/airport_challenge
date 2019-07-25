require "Airport.rb"
require "Plane.rb"

describe Airport do

  it "allows a plane to land" do

    expect(subject.land Plane).to eq("Plane landed")
  end


  it "allows a plane to take off, and confirms its gone" do
  expect(subject.takeoff Plane).to eq("Plane has takenoff")
  end
end
