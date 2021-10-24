require 'airport'

describe Airport do
  
  describe "#land" do
    
    it 'responds to the method land and lands a plane in the airport' do
      airport = Airport.new
      plane = Plane.new
      expect(airport).to respond_to :land
      expect(airport.land(plane)).to eq plane
    end

    it "raises an error when airport is full" do
      airport = Airport.new
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "Airport is full"
    end

  end

  describe "#plane" do
    it 'returns planes in the airport' do
      airport = Airport.new
      plane = Plane.new
      subject.land(plane)
      expect(subject.plane).to eq plane
    end
  end

  describe "#take_off" do
    
    it 'responds to the method take_off and returns a new plane' do
      airport = Airport.new
      plane = Plane.new
      expect(airport).to respond_to :take_off
    end

    it "raises an error if there are no planes in the airport" do
      airport = Airport.new
      plane = Plane.new
      expect { airport.take_off }.to raise_error "No planes available"
    end
  end

end

# 1. A plane needs to be able to land at an airport
# 2. A plane needs to be able to take off from an airport
