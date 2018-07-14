# die - do it expect

require 'airport'

describe Airport do 
  it "airport.new creates a new airport" do
    expect(Airport.new).to be_instance_of Airport
  end 
  it "has the ability to accept a plane to land" do 
    expect(subject).to respond_to(:land).with(1).argument 
  end 
  it "returns the plane (landed in the airport) when the plane has landed" do 
   plane = Plane.new 
   expect(subject.land(plane)).to eq plane 
  end 
end 

# user story 1 
# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport
