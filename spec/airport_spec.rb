require 'airport'

describe Airport do
  it 'Creates an airport' do
    testing = Airport.new("hello", "world")
    expect(testing).to be_an_instance_of Airport
  end
  
  it 'Allows planes to take off' do 
    expect(Airport.new("hello", "world")).to respond_to(:take_off)
  end    

  it 'Checks if planes meet requirements for landing' do 
    london = Airport.new("London")
    plane1 = Plane.new("Boeing", "Paris", "London", "Flying")
    plane1.request_landing(plane1)
    expect(london.check_requests).to include(plane1) 
  end 

  it 'Accepts planes that meet landing requirements' do 
    london = Airport.new("London")
    plane1 = Plane.new("Boeing", "Paris", "London", "Flying")
    plane1.request_landing(plane1)
    london.accept_requests
    expect(london.accept_requests).to be_an_instance_of Array
  end 

end
