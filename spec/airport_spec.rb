require "airport"

describe Airport do

  it "expects Airport to make working airports" do
    airport = Airport.new(:capacity)
    expect(airport).to eq airport
  end

  it "has a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#land" do
    it "airport to land a plane" do
      expect(Airport.new(10)).to respond_to(:land).with(1).argument
    end
    
    it "airport not allow landing when is full" do
      airport = Airport.new(:capacity)
      plane = Plane.new
      subject.capacity.times do
        airport.land(plane)
      end
      expect { airport.land(plane) }.to raise_error "Error, airport full!"
    end
  end

 
  describe "#take_off" do
    it "airport to take_off a plane" do
      expect(Airport.new(:capacity)).to respond_to(:take_off).with(1).argument
    end
  end
  
end
