require './docs/airport'
require './docs/plane'

describe Airport do 
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  
  context "weather good" do 

  before { allow(airport).to receive(:stormy?).and_return(false) }

    it "Instruct plane to land" do
      expect(airport).to respond_to(:dock)
    end

   it "Adds a plane to an array in airport when landing method ran" do
     airport.dock(plane)
      expect(airport.planes).to eq([plane])
    end 

    it "Instructs plane to take off" do 
      expect(airport).to respond_to(:undock)
    end 

    it "Removed correct plane from array when taking off method ran" do
      airport.dock(plane)
      airport.undock(plane)
      expect(airport.planes).not_to include(plane)
    end 
  

    it "User able to change capacity" do
      airport2 = Airport.new(800)
      expect(airport2.capacity).to eq(800)
    end 

   it "Cannot land plane in full airport" do
      airport.capacity.times {airport.dock(plane)}
      expect{airport.dock(plane)}.to raise_error("Unable to land as Airport is full.")
    end  
  end 
end 
