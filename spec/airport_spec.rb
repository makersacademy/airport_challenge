require 'airport.rb'

describe Airport do 

  let(:plane) { double :plane, landed: true, takingoff: true }

  it "Airport should create a new instances of airport" do
    port = Airport.new
    expect(port).to be_instance_of Airport
  end

  describe "#land" do
    it "plane should be able land" do
      port = Airport.new
      port.weather = "sunny"
      expect(port.land(plane)).to eq true
    end
    it "plane should not land if airport is full" do
      port = Airport.new
      port.land(plane)
      port.weather = "sunny"
      expect{port.land(plane)}.to raise_error "The airport is full"
    end
    it "plane should not land if the weather is stormy" do
      port = Airport.new
      port.weather = "stormy"
      expect{port.land(plane)}.to raise_error "Weather is stormy"
    end
    it "plane should not land if airport is full and the weather is stormy" do
      port = Airport.new
      port.land(plane)
      port.weather = "stormy"
      expect{port.land(plane)}.to raise_error "Airport full and weather is stormy"
    end
  end

  describe "#takeoff" do
    it "plane should take off" do
      port = Airport.new
      port.weather = "sunny"
      expect(port.takeoff(plane)).to eq true
    end
    it "plane can not take off if weather is stormy" do
      port = Airport.new
      port.weather = "stormy"
      expect{port.takeoff(plane)}.to raise_error "Weather is stormy"
    end
  end
end
