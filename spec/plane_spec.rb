require "plane"
require "airport"

describe Plane do
  it "allows user to create a plane" do
    expect(subject).to be_instance_of Plane
  end

  # Landing 
  it "can land" do
    expect(subject).to respond_to(:land)
  end

  it "plane can land at an airport" do

    new_airport = Airport
    expect(subject.land(new_airport)).to eq new_airport
  end

  # Taking off
  it "can take off" do
    expect(subject).to respond_to(:take_off)
  end

  it "can confirm that the plane has left the airport" do
    expect(subject.take_off).to eq "plane has taken off and longer at airport"
  end
    
end