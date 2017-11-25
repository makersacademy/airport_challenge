require "airport.rb"
require "plane.rb"
describe Airport do
  plane = Plane.new

  it "should allow the user to set capacity for the docking station" do
    expect(subject.land_plane(plane)).to eq plane
  end

  it "should be able to tell plane to take off" do
    expect(subject.take_off(plane)).to eq nil
  end
end
