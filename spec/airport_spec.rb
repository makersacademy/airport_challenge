require "airport"

describe Airport do
  it "planes should be able to land at the airport" do
    srand(1) #not stormy airport
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "we should be able to see that the plane has landed in the airport" do
    srand(1) #not stormy airport
    expect(subject.land(plane = Plane.new)).to match_array(Array.new << plane)
  end

  it "planes should be able to take off from the airport" do
    srand(1) #not stormy airport
    expect(subject).to respond_to(:takeoff)
  end

  it "we should be able to see that the plane has taken off from the airport" do
    srand(1) #not stormy airport
    subject.land(plane = Plane.new)
    subject.land(plane2 = Plane.new)
    subject.takeoff(plane)
    expect(subject.planes).not_to include(plane)
  end

  it "should prevent landing when airport is full" do
    Airport::DEFAULT_CAPACITY.times { subject.land(plane = Plane.new) }
    expect { subject.land(plane = Plane.new) }.to raise_error "Airport full"
  end

  it "airport should initialize with default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "user should be able to put in a custom capacity" do
    srand(1) #not stormy airport
    airport = Airport.new(20)
    expect(airport.capacity).to eq 20
  end

  it "airport should be able to store planes to capacity" do
    srand(1) #not stormy airport
    airport = Airport.new
    Airport::DEFAULT_CAPACITY.times { airport.land(plane = Plane.new) }
    expect(airport.planes.length).to eq Airport::DEFAULT_CAPACITY
  end

  it "airports should be able to display weather conditions - stormy or not stormy" do
    expect(subject.stormy).to be(true).or be(false)
  end

  it "airports should randomly generate a storminess condition" do
    srand(4)
    #rand(100) when seeded with srand(4) will return 46, 55, 69, 1, 87
    #this means only the fifth airport generated should return "true" for stormy
    expect((airport = Airport.new).stormy).to be(false)
    expect((airport = Airport.new).stormy).to be(false)
    expect((airport = Airport.new).stormy).to be(false)
    expect((airport = Airport.new).stormy).to be(false)
    expect((airport = Airport.new).stormy).to be(true)
  end

  it "should prevent takeoff when weather is stormy" do
    srand(9) #creates stormy airport
    expect{subject.land(plane = Plane.new)}.to raise_error "Cannot land at stormy airport"
  end

end
