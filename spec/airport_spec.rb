require_relative '../docs/classes.rb'
describe Airport do 
    
it "responds to land method" do 
  expect(subject).to respond_to(:land).with(1).argument
end 

it "responds to take_off method" do  
  expect(subject).to respond_to(:take_off).with(1).argument
end

it "confirms the plane is no longer at the airpoirt, after takeoff method called" do
  plane = Plane.new
  expect(subject.take_off(plane)).to eq(true)
end  

it "prevents landing when the airport if full at default capacity" do 
  plane = Plane.new 
  Airport::DEFAULT_CAPACITY.times{subject.land(plane)}
  expect{subject.land(plane)}.to raise_error("Airport Full. Cannot Land") 
end 

it "prevents landing when full, at non default capacity" do 
  plane = Plane.new
  airport = Airport.new(50) 
  50.times{ airport.land(plane) } 
  expect{airport.land(plane)}.to raise_error("Airport Full. Cannot Land") 
end 

end 

