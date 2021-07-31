require './lib/airport.rb'

describe Airport do 
  before(:each) do 
    @airport = Airport.new
    
  end 

  it "responds to land method" do
    expect(@airport).to respond_to(:land)
  end
  
  it "Land method can recieved a plane" do
    plane = Plane.new
    expect(@airport.land(plane)).to eq([plane]) 
  end

  it "Makes plane take off, removing instance from @plane, then it checks array is now n-1" do 
    @plane = []
    @plane << Plane.new
    expect(@airport.take_off).to eq([])
  end 
end
