require "airport"
describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  
  describe "initialize" do
    it "creates an instance of an airport" do
      expect(airport).to be_an_instance_of(Airport)
    end
  end
  
  it "has a variable capacity" do
    airport = Airport.new(50)
    50.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error "Airport is full"
  end
  
  describe "#take_off" do
    it "takes off waiting planes" do
      airport.land(plane)
      expect(airport.take_off).to eq plane
    end
  end
    
  it "raises an error when there are no waiting planes" do
    expect { airport.take_off }.to raise_error "No waiting planes"
  end
      
  describe "#land" do
    it "lands flying planes" do
      expect(airport.land(plane)).to eq plane
    end
  end
  
  it "raises an error when the airport is full" do
    airport.capacity.times { airport.land(plane) }
    expect { airport.land(plane) }.to raise_error "Airport is full"
  end
  
  describe "attribute reader (the former plane method)" do
    it 'returns the number of planes that landed' do
      airport.land(plane)
      expect(airport.plane).to eq plane
    end
  end
  
end
