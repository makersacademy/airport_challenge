# die - do it expect #sort out rspec run error (rubocop)
#need to add fail cases if planes < capacity and weather 
#look at rubric this pm 
require 'airport'
require 'weather'
describe Airport do 
  it "airport.new creates a new airport" do
    expect(Airport.new).to be_instance_of Airport
  end 
  it "contains a hanger for planes to be stored (a hanger)" do
    expect(subject.hanger).to eq([]) 
  end  
  it "has the ability to accept a plane to land" do 
    expect(subject).to respond_to(:land).with(1).argument 
  end 
  it "returns the plane (landed in the airport) when the plane has landed" do 
   plane = Plane.new 
   expect(subject.land(plane)).to eq(plane) 
  end 
  it "has the ability to instuct  a plane to take off" do 
    expect(subject).to respond_to(:takeoff).with(1).argument 
  end 
  it "shows that plane is no longer in airport, once it has taken off" do 
   plane = Plane.new 
   subject.land(plane)
   expect(subject.takeoff(plane)).to eq("plane has taken off!")
   expect(subject.hanger).not_to include(plane) #does running subject.takeoff on the previous line change the state of the hanger? Have not run subject.takeoff? 

   end 
end 

# user story 1 
# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport - done

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport - done

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 