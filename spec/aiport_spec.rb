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
    expect(@airport.land(plane)).to eq(plane) 
  end
end
