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

  it "responds to #stormy?" do
    expect(subject.respond_to?('stormy?')).to eq true
  end

  it "responds to #stormy with an integer between 1 and 7" do
    expect(subject.stormy?).to be < 7
  end

  it "does not allow a plane to take off when stormy? is 6" do
    plane = Plane.new
    subject.land_plane(plane)
    allow(subject).to receive(:stormy?) { 6 }
    expect(subject.take_off(plane)).to eq "Sorry, it's too stormy"
  end

end
