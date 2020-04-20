require './docs/airport'
require './docs/plane'

describe Plane do 
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }


  it "Plane responds to landing" do 
    expect(plane).to respond_to(:land)
  end 

  it "Plane responds to taking off method" do 
    expect(plane).to respond_to(:takeoff)
  end 

  it "Plane responds to flying method" do 
    expect(plane).to respond_to(:flying?)
  end 

  it "Assigns airport to plane when landing" do
    plane.location = "sky"
    plane.land(airport)
    expect(plane.location).to eq (airport)
  end

  it "Changes location to Sky when taken off" do
    plane.takeoff(airport)
    expect(plane.location).to eq("sky")
  end 

  it "Shows flying as equal to location sky" do
    plane.location = "sky"
    expect(plane.flying?).to eq (true)
  end

  it "Raises error if plane is already landed" do 
    plane.location = airport
    expect{plane.land(plane)}.to raise_error "Plane already landed."
  end 
end 


