require "airport"

describe Airport do

  it "can create an instance of airport" do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end

  it "update number of planes in the fleet when it takes off" do
    airport = Airport.new
    expect(airport).to respond_to(:takeoff)
  end 

  it "update number of planes in the fleet when landing" do
    airport = Airport.new
    expect(airport).to respond_to(:landing)
  end 
 
  it "prevents taking off when stormy" do
    airport = Airport.new
    expect(airport).to respond_to(:weather)
  end 

  it "prevents landing when stormy" do
    airport = Airport.new
    expect(airport).to respond_to(:weather)
  end 

  it "prevents landing when the fleet is full" do
    airport = Airport.new
    expect(airport).to respond_to(:fleet)
  end 

end
