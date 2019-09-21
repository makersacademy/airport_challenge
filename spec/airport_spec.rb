require 'airport.rb'
describe Airport do

  it "responds to land method with 1 argument" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "can land a plane" do
    subject.weather = "sunny"
    plane = Plane.new
    subject.planes = [] # my airport can only contain 1 plane so I am manually emptying the airport
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it "responds to takeoff with 1 argument" do
    expect(subject).to respond_to(:takeoff).with(1).argument
  end

  it "can takeoff a plane with confirmation" do
    subject.weather = "sunny"
    plane = Plane.new
    expect(subject.takeoff(plane)).to eq([])
  end

  it "returns error if airport is full when landing" do
    subject.weather = "sunny"
    plane2 = Plane.new
    expect { subject.land(plane2) }.to(raise_error("Warning: Too many planes at airport"))
  end

  it "returns error if weather is stormy when taking off" do
    subject.weather = "stormy" # ensures the weather variable will be set to stormy (overiding the random generator)
    plane = Plane.new
    expect { subject.takeoff(plane) }.to(raise_error("Warning: Weather is too stormy to depart"))
  end

  it "returns error if weather is stormy when landing" do
    subject.weather = "stormy" # ensures the weather variable will be set to stormy (overiding the random generator)
    plane = Plane.new
    expect { subject.land(plane) }.to(raise_error("Warning: Weather is too stormy to land"))
  end

  it "can show capacity" do
    expect(subject).to respond_to(:capacity)
  end

  it "can change the capacity" do
    expect(subject.capacity = 5).to eq(5)
  end

end
