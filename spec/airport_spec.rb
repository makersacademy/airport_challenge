require_relative '../docs/airport.rb'
require_relative '../docs/plane.rb'
describe Airport do 
  
  it "responds to land method" do 
    expect(subject).to respond_to(:land).with(1).argument
  end 

  it "responds to take_off method" do  
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "confirms the plane is no longer at the airpoirt, after takeoff method called" do
    plane = Plane.new
    subject.land(plane, "sunny_test") 
    expect(subject.take_off(plane, "sunny_test")).to eq(true)
  end  

  it "prevents landing when the airport if full at default capacity" do 
    plane = Plane.new 
    Airport::DEFAULT_CAPACITY.times { subject.land(plane, "sunny_test")  }
    expect { subject.land(plane, "sunny_test") }.to raise_error("Airport Full. Cannot Land") 
  end 

  it "prevents landing when full, at non default capacity" do 
    plane = Plane.new
    airport = Airport.new(50) 
    50.times { airport.land(plane, "sunny_test") } 
    expect { airport.land(plane, "sunny_test") }.to raise_error("Airport Full. Cannot Land") 
  end 

  it "prevents take_off when the weather is stormzy" do 
    airport = Airport.new(10)
    plane = Plane.new 
    airport.land(plane, "sunny_test")
    expect { airport.take_off(plane, "stormy_test") }.to raise_error("Weather Stormy") 
  end 

  it "prevents landing when the weather is stormzy" do 
    airport = Airport.new(10) 
    plane = Plane.new 
    expect { airport.land(plane, "stormy_test") }.to raise_error("Weather Stormy")
  end 
  
  #it "prevents taking off when plane is already flying" do 
    # plane = Plane.new 
    #expect { subject.take_off(plane) }.to raise_error("Plane Already Flying") 
  #end
  
  #it "prevents landing if the plane is already landed" do 
  #  plane = Plane.new
  #  subject.land(plane) 
  #  expect { subject.land(plane) }.to raise_error("Plane Already Landed")
  #end 
end 
