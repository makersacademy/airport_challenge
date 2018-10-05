require 'airport'
require 'plane'
describe Airport do 
  it "checks land method argument" do 
    expect(subject).to respond_to(:land).with(1).argument
  end
  it "lands a plane" do 
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end
  it "checks takeoff method argument" do
    expect(subject).to respond_to(:takeoff).with(1).argument
  end
  it "checks here? method" do 
    expect(subject).to respond_to(:here?)
  end
#  it "don't let plane takeoff if weather stormy" do 
#    airport = Airport.new
#    plane = Plane.new  
#    allow(airport).to_recieve().and_return(5)
#    expect(airport.takeoff(plane)).to raise_error 'Weather is too stormy to take off'
#  end
end
