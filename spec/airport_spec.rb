require "airport"

describe Airport do
  it "allows user to create an airport" do
    expect(subject).to be_instance_of Airport
  end
  
  # Landing 
  it "land is a function" do
    expect(subject).to respond_to(:land)
  end  

  it "can land a plane" do

    plane = Plane
    expect(subject.land(plane)).to eq plane
  end
  
  # Taking off
  it "can take off" do
    expect(subject).to respond_to(:take_off)
  end

  it "can confirm that the plane has left the airport" do
    expect(subject.take_off).to eq "plane has taken off and longer at airport"
  end
    

end