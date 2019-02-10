require 'airport'
require 'plane'
describe Airport do
  before :each do
    @airport = Airport.new
  end
  it "Lets a plane land" do
    expect(@airport).to respond_to(:land).with(1).arguments
  end

  it "Lets the same plane land and takeoff" do
    plane = Plane.new
    @airport.land(plane)
    expect(@airport.take_off(plane)).to eq plane
  end

  it "Lets a plane land and takeoff then checks that the plane has left" do
    plane = Plane.new
    @airport.land(plane)
    @airport.take_off(plane)
    expect(@airport.here?(plane)).to eq false
  end

  it "Dosen't allow planes to takeoff when its stormy" do
    plane = Plane.new
    @airport.land(plane)
    @airport.weather("stormy")
    expect { raise @airport.take_off(plane) }.to raise_error("It is too stormy to land or takeoff")
  end

  it "Dosen't allow planes to land when its stormy" do
    plane = Plane.new
    @airport.weather("stormy")
    expect { @airport.land(plane) }.to raise_error("It is too stormy to land or takeoff")
  end

  it "Dosen't allow planes to land when airport is full" do
    plane = Plane.new
    plane2 = Plane.new
    @airport.land(plane)
    expect { @airport.land(plane2) }.to raise_error("The airport is full")
  end

  it "Can set the capacity of the airprot to 10" do
    @airport = Airport.new(10)
    expect(@airport.capacity).to eq 10
  end

  it "Has a defualt capacity of 1" do
    expect(@airport.capacity).to eq 1
  end

  it "Dosen't let a plane that has already landed land again" do
    plane = Plane.new
    @airport = Airport.new(20)
    @airport.land(plane)
    expect { @airport.land(plane) }.to raise_error("This plane has already landed")
  end

  it "Dosen't let a plane take off that isan't in the airport" do
    plane = Plane.new
    expect { @airport.take_off(plane) }.to raise_error("This plane is not in the airport")
  end

  it "Lands 5 planes and has them fly out in a differnet order" do
    planes = []
    5.times { planes << Plane.new }
    airport = Airport.new(5)
    planes.each { |plane| airport.land(plane) }
    planes.shuffle!
    planes.each { |plane| airport.take_off(plane) }
  end
end
