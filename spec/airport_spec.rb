require "airport"
describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  
  describe "initialize" do
    it "creates an instance of an airport" do
      expect(airport).to be_an_instance_of(Airport)
    end
  end
  
  describe "#take_off" do
    it "takes off waiting planes" do
      airport.land(plane)
      expect(airport.take_off).to eq plane
    end
  end
    
  describe "#take_off" do
    it "raises an error when there are no waiting planes" do
      expect { airport.take_off }.to raise_error "No waiting planes"
    end
  end
      
  describe "#land" do
    it "lands flying planes" do
      expect(airport.land(plane)).to eq plane
    end
  end
  
  describe "#land" do
    it "raises an error when the airport is full" do
      Airport::DEFAULT_CAPACITY.times do
        airport.land Plane.new
      end
      expect { airport.land Plane.new }.to raise_error "Airport is full"
    end
  end
  
  describe "attribute reader (the former plane method)" do
    it 'returns the number of planes that landed' do
      airport.land(plane)
      expect(airport.plane).to eq plane
    end
  end
  
end
