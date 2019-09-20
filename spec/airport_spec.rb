require 'airport.rb'
describe Airport do

  it "responds to land method with 1 argument" do
    expect(subject).to respond_to(:land).with(1).argument
  end

 it "can land a plane" do
   plane = Plane.new
   subject.planes = [] # my airport can only contain 1 plane so I am manually emptying the airport
   subject.land(plane)
   expect(subject.planes).to include(plane)
 end

 it "responds to takeoff with 1 argument" do
   plane = Plane.new
   expect(subject).to respond_to(:takeoff).with(1).argument
 end

 it "can takeoff a plane with confirmation" do
   plane = Plane.new
   expect(subject.takeoff(plane)).to eq([])
 end

 it "returns error if airport is full when landing" do
   plane2 = Plane.new
   expect{subject.land(plane2)}.to raise_error {"Warning: Too many planes at airport"}
 end

 it "returns error if weather is stormy when taking off" do
   weather = double("stormy")
   plane = Plane.new
   expect{subject.takeoff(plane)}.to raise_error {"Warning: Weather is too stormy to depart"}
 end
end
