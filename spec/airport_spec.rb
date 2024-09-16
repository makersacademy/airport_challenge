require "airport"

describe Airport do
  it "allows user to create an airport" do
    expect(subject).to be_instance_of Airport
  end
  
  # Landing 
describe "Landing" do
  it "land is a function" do
    expect(subject).to respond_to(:land)
  end
end  
  
  # Taking off
describe "Taking off" do
  it "can take off" do
    expect(subject).to respond_to(:take_off)
  end

  it "can confirm that the plane has left the airport" do
    expect(subject.take_off).to eq "plane has taken off and longer at airport"
  end
end
  # Capacity    
describe "Capacity" do
  it "will prevent landing when the airport is full " do
    plane = Plane.new
    10.times{subject.land(plane)}

    expect{subject.land(plane)}.to raise_error "airport is full"
  end

  it "instantiated with a capacity of 5" do
    airport = Airport.new(5)
    expect(airport.capacity).to eq 5
  end
end

describe "Hanger" do
  # before loop here would be better
  it "will initialise with an empty array" do
    expect(subject.hanger).to eq []
  end

  it "will add a plane to the hanger when landed" do 
  plane = Plane.new
  airport = Airport.new
  airport.land(plane)
  expect(airport.hanger.length).to eq 1
  end

  it "will add a plane to the hanger when landed" do 
  plane = Plane.new
  airport = Airport.new
  airport.land(plane)
  airport.take_off
  expect(airport.hanger.length).to eq 0
  end
  
  end

end