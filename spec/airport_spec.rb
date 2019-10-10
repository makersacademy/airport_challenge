require 'airport'
require 'plane'

describe Airport do #can use subject. as im getting the class name in describe
  it "can allow a plane to takeoff" do
    plane = Plane.new

    subject.land(plane) # land the plane before taking off
    subject.takeoff(plane)

    expect(subject.plane_count).to eq 0
  end

  it "can allow a plane to land" do
    plane = Plane.new

    subject.land(plane)
    expect(subject.plane_count).to eq(1)
  end

  it "can check to see when a plane lands if the airport is full" do
    plane = Plane.new

    10.times { subject.land(plane) }
    p subject.plane_count
    expect{ subject.land(plane) }.to raise_error 
  end

  #suggested tests to add for planes status on land/takeoff

  it "can check if a plane is flying after takeoff" do
    plane = Plane.new
    subject.takeoff(plane) #takeoff the plane the flying variable changes to true
    expect(plane.is_flying).to eq(true)
  end

  it "it can check if a plane is not flying after landing" do
    plane = Plane.new
    subject.land(plane) #runs this method 
    expect(plane.is_flying).to eq(false)
  end
end
