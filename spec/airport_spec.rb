require_relative "../lib/airport.rb"
require_relative "../lib/plane.rb"

describe Airport do
  
  let(:airport) {Airport.new(false)}
  let(:plane) {Plane.new}

  describe "#initialize" do

    it "sets hangar_capacity to users choice" do
      airport = Airport.new(false, 50)
      expect(airport.hangar_capacity).to eq(50)
    end

    it "if user does not input capacity, it will be set to 20" do
      expect(airport.hangar_capacity).to eq(20)
    end
  end

  describe "#land" do
    
    it "responds to land plane method" do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it "lands a plane" do
      expect(airport.land(plane)).to eq [plane]
    end

    it "raises an error when the hangar is full(hangar_capacity in hangar)" do
      airport.hangar_capacity.times{airport.land(plane)}
      expect{airport.land(plane)}.to raise_error("Cannot land, Airport is full")
    end

    it "raises an error when the weather is stormy" do
      airport = Airport.new(true)
      expect{airport.land(plane)}.to raise_error("Cannot land, weather is stormy")
    end  
  end

  describe "#take_off" do

    it "responds to take_off plane method" do
      expect(airport).to respond_to(:take_off)
    end
    
    it "allows a landed plane to take_off from hangar" do
      airport.land(plane)
      expect(airport.take_off).to be_instance_of(Plane)
    end

    it "raises an error when the hangar is empty(0 planes in hangar)" do
      expect{airport.take_off}.to raise_error("Cannot take off, there are no planes in the hangar")
    end  

    it "raises an error when the weather is stormy" do
      airport.land(plane)
      airport.weather_is_stormy = true
      expect{airport.take_off}.to raise_error("Cannot take off, weather is stormy")
    end  
  end  
    
  describe "#in_airport?" do

    it "checks whether plane has indeed taken off" do
      airport.land(plane)
      airport.take_off
      expect(airport.in_airport?(plane)).to be false
    end  

    it "checks whether plane in the airport/hangar" do
      airport.land(plane)
      expect(airport.in_airport?(plane)).to be true
    end 
  end
  
  describe "#is_stormy?" do

    it "states whether it is stormy or not, providing a boolean- private method" do
      airport = (Airport.new).is_stormy?   
      expect([true, false]).to include airport
    end  
  end 
end