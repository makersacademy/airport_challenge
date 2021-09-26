require './docs/airport'

describe Airport do

  it "Allows a plane to land" do
    airport = Airport.new
    plane = Plane.new
    expect(airport).to respond_to(:land).with(1).argument
  end

  it "Checks for the plane when it has landed" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.plane).to eq plane
  end

  it "Allows a plane to take off" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport).to respond_to(:takeoff).with(1).argument
  end

  it "Checks if the airport contains the plane after takeoff" do
    airport = Airport.new
    plane1 = Plane.new
    plane2 = Plane.new
    airport.land(plane1)
    airport.land(plane2)
    airport.takeoff(plane1)
    expect(airport.hangar).not_to include(plane1)
  end

  it "Doesn't allow a plane to land when the airport is full" do
    airport = Airport.new(1)
    plane1 = Plane.new
    plane2 = Plane.new
    airport.land(plane1)
    expect { airport.land(plane2) }.to raise_error "Airport is full"
  end

  it "Has a default capacity of 20" do
    airport = Airport.new
    Airport::DEFAULT_CAPACITY.times do
      airport.land(Plane.new)
    end
    expect { airport.land(Plane.new) }.to raise_error "Airport is full"
  end

  it "Allows to check the weather" do
    airport = Airport.new
    allow(airport).to receive(:rand).and_return(1)
    expect(airport.check_weather).to eq "It is a clear, sunny day."
    allow(airport).to receive(:rand).and_return(10)
    expect(airport.check_weather).to eq "It is stormy."
  end

  it "Doesn't allow landing on a stormy day" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:rand).and_return(10)
    airport.check_weather
    expect { airport.land(plane) }.to raise_error "Cannot land: stormy weather"
  end

  it "Allows landing on a clear day" do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:rand).and_return(1)
    airport.check_weather
    expect { airport.land(plane) }.to_not raise_error
  end

  it "Doesn't allow takeoff on a stormy day" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    allow(airport).to receive(:rand).and_return(10)
    airport.check_weather
    expect { airport.takeoff(plane) }.to raise_error "Cannot takeoff: stormy weather"
  end

  it "Allows takeoff on a sunny day" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    allow(airport).to receive(:rand).and_return(1)
    airport.check_weather
    expect { airport.takeoff(plane) }.to_not raise_error
  end

# TESTING FOR EDGE CASES

  it "Raises an exception when the same plane tries to land twice" do
    plane = Plane.new
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error "Error: Plane already in the hangar."
  end

  it "Raises an exception when the same plane tries to take off whilst already in the air" do
    plane = Plane.new
    subject.land(plane)
    subject.takeoff(plane)
    expect { subject.takeoff(plane) }.to raise_error "Error: Plane is not in the hangar."
  end

  # RSpec feature test that lands and takes off a number of planes

  it "Simulates a busier airport" do
    airport = Airport.new
    plane1 = Plane.new
    airport.land(plane1)
    plane2 = Plane.new
    airport.land(plane2)
    plane3 = Plane.new
    airport.land(plane3)
    plane4 = Plane.new
    airport.land(plane4)
    plane5 = Plane.new
    airport.land(plane5)
    plane6 = Plane.new
    plane7 = Plane.new
    airport.takeoff(plane3)
    airport.takeoff(plane1)
    airport.land(plane7)
    airport.land(plane6)
    expect(airport.hangar).to eq ([plane2, plane4, plane5, plane7, plane6])
  end
    
end
