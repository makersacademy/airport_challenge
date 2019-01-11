require "airport"

describe Airport do
  it "Has a method to allow user to check plane has left airport" do
    expect(subject).to respond_to(:verify_takeoff).with(1).argument
  end

  it "Is able to store landed planes" do
    plane = Plane.new
    plane.land(subject)
    expect(subject.planes.first).to eq plane
  end
end
=begin
it "Is able to store landed planes" do
  plane = Plane.new
  plane.land(subject)
  expect(subject.planes.first).to eq plane
=end
