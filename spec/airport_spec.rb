# require the relevant files
require 'airport'
require 'plane'
require 'weather'

describe Airport do
  # create Plane instance, call land method, and expect the capacity 
  # to have reduced to 4 from a default of 5
  it "allows ATC to instruct a plane to land" do
    plane = Plane.new("flying")
    subject.land(plane)
    expect(subject.capacity).to eq(4)
  end

  # create Plane instance, call take_off method, and expect the capacity 
  # to increase to 6 from default of 5.
  it "allows ATC to instruct a plane to take off" do
    plane = Plane.new("landed")
    subject.take_off(plane)
    expect(subject.capacity).to eq(6)
  end

  # create Airport instance with 0 capacity, and expect an error when Plane 
  # instance tries to land
  it "prevents landing when the airport is full" do
    airport = Airport.new(0)
    plane = Plane.new("flying")
    expect { airport.land(plane) }.to raise_error
  end

  # check that airport responds to generate_weather
  it "can receive a weather condition" do
    expect(subject).to respond_to(:generate_weather)
  end

  # check that either Sunny or Stormy is generated
  it "can generate random weather" do
    airport = Airport.new
    options = ["Sunny", "Stormy"]
    expect(options).to include(airport.generate_weather)
  end

  # use stub to force the generate weather method to return "Stormy", 
  # which should raise exception
  it "prevents planes taking off when weather is stormy" do
    airport = Airport.new
    plane = Plane.new("landed")
    # allow(airport).to receive(:generate_weather).and_return("Stormy")
    airport.weather = "Stormy"
    expect { airport.take_off(plane) }.to raise_error
  end

  # check that take off is allowed during sunny weather
  it "allows takeoff when weather is sunny" do
    airport = Airport.new
    plane = Plane.new("landed")
    airport.weather = "Sunny"
    subject.take_off(plane)
    expect(subject.capacity).to eq(6)
  end

  # edge case (?) check to stop a flying plane from accepting take off method
  it "prevents a flying plane from taking off" do
    airport = Airport.new
    plane = Plane.new("flying")
    expect { airport.take_off(plane) }.to raise_error
  end

  # edge case (?) check to stop a landed plane from accepting land method
  it "prevents a landed plane from trying to land again" do
    airport = Airport.new
    plane = Plane.new("landed")
    expect { airport.land(plane) }.to raise_error
  end
end
