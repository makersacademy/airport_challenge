require "airport"

describe Airport do
  
  describe "#land" do
    it "tells a plane to land" do
      airport = Airport.new
      expect(airport).to respond_to(:land).with(1).argument
    end
  end

  describe "#take_off" do
    it "tells a plane to take off" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
  end
  
   it "will not allow more planes to land if it is full" do
      airport = Airport.new
      20.times do 
        airport.land(:plane)
      end
      expect { airport.land(:plane) }.to raise_error "Cannot land plane, airport is full"
    end
  
  it "will raise an error if plane tries to land when stormy" do
    airport = Airport.new
    allow(airport).to receive(:is_stormy?).and_return true
    expect { airport.land(:plane) }.to raise_error "Unsafe to land, weather is stormy"
  end
end