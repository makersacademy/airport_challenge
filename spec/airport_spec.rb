require "airport"

describe Airport do

  it "planes should be able to land at the airport" do
    srand(1) # not stormy airport
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "we should be able to see that the plane has landed in the airport" do
    srand(1) # not stormy airport
    plane = Plane.new
    plane.flying = true
    expect(subject.land(plane)).to match_array(Array.new << plane)
  end

  it "planes should be able to take off from the airport" do
    srand(1) # not stormy airport
    expect(subject).to respond_to(:takeoff)
  end

  it "we should be able to see that the plane has taken off from the airport" do
    srand(1) # not stormy airport
    plane = Plane.new
    plane.flying = true
    plane2 = Plane.new
    plane2.flying = true
    subject.land(plane)
    subject.land(plane2)
    subject.takeoff(plane)
    expect(subject.planes).not_to include(plane)
  end

  it "should prevent landing when airport is full" do
    plane = double("plane")
    Airport::DEFAULT_CAPACITY.times { subject.planes << plane }
    expect { subject.land(plane) }.to raise_error "Airport full"
  end

  it "airport should initialize with default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "user should be able to put in a custom capacity" do
    srand(1) # not stormy airport
    airport = Airport.new(20)
    expect(airport.capacity).to eq 20
  end

  it "airport should be able to store planes to capacity" do
    srand(1) # not stormy airport
    airport = Airport.new
    Airport::DEFAULT_CAPACITY.times { plane = Plane.new
                                      plane.flying = true
                                      airport.land(plane)
    }
    expect(airport.planes.length).to eq Airport::DEFAULT_CAPACITY
  end

  it "airports should be able to display weather conditions - stormy or not stormy" do
    expect(subject.stormy).to be(true).or be(false)
  end

  it "airports should randomly generate a storminess condition" do
    srand(4)
    # rand(100) when seeded with srand(4) will return 46, 55, 69, 1, 87
    # this means only the fifth airport generated should return "true" for stormy
    airport_weather = []
    5.times { airport_weather.push(Airport.new.stormy) }
    expect(airport_weather).to match_array [false, false, false, false, true]
  end

  it "should prevent takeoff when weather is stormy" do
    srand(9) # creates stormy airport
    expect { subject.land(plane = Plane.new) }.to raise_error "Cannot land at stormy airport"
  end

  it "should prevent landing when weather is stormy" do
    srand(9) # creates stormy airport
    subject.planes << plane = Plane.new
    expect { subject.takeoff(plane) }.to raise_error "Cannot takeoff from stormy airport"
  end

  it "planes should only be able to take off from an airport they are in" do
    expect { subject.takeoff(plane = Plane.new) }.to raise_error "Specified plane not at this airport"
  end

  it "plane cannot takeoff if it is flying" do
    plane = Plane.new
    plane.flying = true
    subject.planes << plane
    expect { subject.takeoff(plane) }.to raise_error "Plane cannot take off if it is already flying"
  end

  it "only flying plane can land" do
    plane = Plane.new
    expect { subject.land(plane) }.to raise_error "Only flying plane can land"
  end

  it "only planes can land at an airport" do
    expect { subject.land("hello") }.to raise_error "Only planes can land at an airport"
  end

end
