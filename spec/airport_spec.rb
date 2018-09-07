require 'airport.rb'

describe Airport do

  it "responds to #land_plane" do
    expect(subject.respond_to?('land_plane')).to eq true
  end

  it "is initialized with an empty plane list" do
    expect(subject.plane_list).to eq []
  end

  it "responds to #take_off" do
    expect(subject.respond_to?('take_off')).to eq true
  end

  it "stores a plane in it's plane list when a plane is instructed to land" do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.plane_list.include?(plane)).to eq true
  end

  it "removes a plane from it's plane list when the plane takes off" do
    plane = Plane.new
    subject.land_plane(plane)
    subject.take_off(plane)
    expect(subject.plane_list.include?(plane)).to eq false
  end

end
