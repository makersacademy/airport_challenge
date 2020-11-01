require 'atc'
require 'plane'

describe Airport do
#1
  it "can instruct a plane to land" do
    expect(subject).to respond_to(:plane_land)
  end
#2
  it "can instruct a plane to take off" do
    expect(subject).to respond_to(:plane_takeoff)
  end
# #3
  it "can prevent a plane from landing if the weather is stormy" do
    allow(@weather).to receive("stormy")
    expect{(subject.plane_land(Aircraft.new))}.to raise_error("Plane cannot land")
  end
#4
  it "can prevent a plane from taking off if the weather is stormy" do
    expect{(subject.plane_takeoff(Aircraft.new))}.to raise_error("Plane delayed")
  end
#5
  it "can prevent a plane from landing if the airport is full" do
    expect(subject).to respond_to(:check_runways)
  end

#6
  it "can tell when a runway becomes occupied" do
    expect(subject).to respond_to(:plane_present)
  end

  it "can tell when a plane has left the airport" do
    expect(subject).to respond_to(:plane_not_present)
  end

end

describe Aircraft do

#7
  it "can respond to the land method" do
    expect(subject).to respond_to(:land)
  end

  it "knows when a plane has landed" do
    expect(subject.planes).to include(plane)
  end

#8
  it "can declare that it has landed" do
    expect(subject.land).to eq("landed")
  end

#9
  it "can takeoff" do
    expect(subject).to respond_to(:takeoff)
  end

#10
  it "can declare that it is airbourne" do
    expect(subject.takeoff).to eq("airbourne")
  end

end
