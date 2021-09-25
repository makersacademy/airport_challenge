require 'airport'

describe Airport do 
 # let (:grounded_plane) {double("grounded_plane", :grounded => true)}
 # let (:plane_in_flight) {double("plane_in_flight", :grounded => false)}


  it "Should keep track of the amount of plane instances in airport" do
   # allow(grounded_plane).to receive(:grounded)
    airport = Airport.new(Plane.new)
    expect(airport.hangar).to be_a Array
  end 

  it "Should raise an error and prevent landing when the airport is full" do
   # allow(grounded_plane).to receive(:land)

    airport = Airport.new(Plane.new)
    airport.capacity = 1
    expect { airport.receive(Plane.new) }.to raise_error("The airport is full")
  end 

  it "Should be able to have it's capacity manually set" do 
    airport = Airport.new
    airport.capacity = 45 
    expect(airport.capacity).to eq(45)
  end

  it "Should have a default capacity of 15" do 
    airport = Airport.new
    expect(airport.capacity).to eq(15)
  end

  it "Should release an instance of the plane object from it's collection upon takeoff" do
    plane = Plane.new
    airport = Airport.new(plane)
    airport.weather = 2
    airport.lose(plane)
    expect(airport.hangar.length).to eq(0)
  end

  it "Should have a weather instance variable set to an integer value" do 
    airport = Airport.new
    expect(airport.weather).to be_a Integer
  end

  it "Should have a randomly generated value assigned to the weather instance variable" do 
    airport1 = Airport.new
    airport2 = Airport.new
    airport3 = Airport.new
    airport4 = Airport.new 
    expect(airport1.weather == airport2.weather && airport2.weather == airport3.weather && airport4.weather == airport1.weather).to be_falsey
  end

  it "Should refuse to let planes land on the rare occasion the weather is stormy" do
    airport = Airport.new 
    plane = Plane.new
    airport.weather = 9
    expect { airport.receive(plane) }.to raise_error("The weather is too stormy to land")
  end

  it "Should refuse to let planes take off on the rare occasion the weather is stormy" do 
    airport = Airport.new
    plane1 = Plane.new
    plane2 = Plane.new
    airport.weather = 2
    airport.receive(plane1)
    airport.receive(plane2)
    airport.weather = 10
    expect { airport.lose(plane1) }.to raise_error("The weather is too stormy to take off")
  end 

  it "Should automatically set a plane's grounded instance variable to true upon receiving the plane at the airport" do
    airport = Airport.new
    plane = Plane.new
    airport.weather = 2
    airport.receive(plane)
    expect(plane.grounded).to eq(true)
  end 

  it "Should only allow planes to take off from airports they are in" do 
    lisbon = Airport.new
    lisbon.weather = 2
    london = Airport.new
    london.weather = 2 
    plane1 = Plane.new
    plane2 = Plane.new
    london.receive(plane1)
    lisbon.receive(plane2)
    expect { lisbon.lose(plane1) }.to raise_error("#{plane1} is not at this airport")
  end

  it "Should allow you to create an instance of an airport with several planes inside" do 
    airport = Airport.new(Plane.new, Plane.new, Plane.new, Plane.new)
    expect(airport.hangar.length).to eq(4)
  end
end 
