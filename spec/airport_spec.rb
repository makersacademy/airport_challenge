require "airport"

describe Airport do 
  subject { Airport.new(:name => "lax", :capacity => 100) }
  
  it "creates an airport with two attributes that can be changed" do 
    expect(subject).to respond_to :landing
  end
  
  it "can instruct a plane to land at the airport if weather is good" do
    plane = "Swiss Air"
    expect{subject.landing(plane)}.to output("Good visibility - land").to_stdout
  end
  
  it "can instruct a plane to take off from an airport and confirm no longer in the airport" do
    value = subject.landing("Swiss Air")
    plane = "Swiss Air"
    expect{subject.take_off(plane)}.to output("Plane is no longer in the airport").to_stdout
  end
  
end

