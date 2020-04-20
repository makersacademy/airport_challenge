require './docs/airport'
require './docs/plane'

describe Plane do 
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  before { allow(airport).to receive(:stormy?).and_return(false) }


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
    plane.location = airport
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

  it "Runs the airport landing request method" do 
    plane.location = "sky"
    plane.land(airport)
    expect(airport.planes).to include(plane)
  end 

  it "Raises error if plane already flying" do 
    plane.location = "sky"
    expect{plane.takeoff(airport)}.to raise_error "Plane already flying."
  end 

  it "Raises error if plane not at that airport" do 
    gatwick = Airport.new 
    plane.location = gatwick
    
    expect { plane.takeoff(airport) }.to raise_error 'The plane is not currently landed at this airport'
  end 

  it "Runs the airport take off request method" do 
    plane.location = "sky"
    plane.land(airport)
    expect { plane.takeoff(airport) }.to change { airport.planes.count }.by(-1)
  end 
end 


