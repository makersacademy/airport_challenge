require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let (:plane) {double :plane}
  let (:weather) {double :weather}
  
  describe "#initialize" do

    it "should set capacity if supplied as argument" do
      airport = Airport.new(99)
      expect(airport.capacity).to eq(99)
    end
      
    it "should set capacity as default if no argument" do
      expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

  end

  describe "#takeoff_plane" do

    before {
      airport.instance_variable_set(:@weather, weather) # replace random weather with controlled stub
      airport.instance_variable_set(:@planes_in_hangar, [plane]) # add plane to hangar to take off
      allow(weather).to receive(:stormy?).and_return(false) # ensure weather not stormy
    }

    it "should instruct plane to take off" do
      expect(airport.takeoff(plane)).to eq plane
    end

    it "should confirm plane has taken off" do
      airport.takeoff(plane)
      expect(airport.planes_in_hangar).not_to include plane
    end

    it "should not allow plane to take off if stormy" do
      allow(weather).to receive(:stormy?).and_return(true)
      expect{ airport.takeoff(plane) }.to raise_error "Planes cannot take off due to bad weather"
    end

  end

  describe "#land_plane" do

    before { 
      airport.instance_variable_set(:@weather, weather) 
      allow(weather).to receive(:stormy?).and_return(false)
    }

    it "should instruct plane to land" do
      expect(airport.land(plane)).to eq plane
    end

    it "should not allow plane to land if stormy" do
      allow(weather).to receive(:stormy?).and_return(true)
      expect{ airport.land(plane) }.to raise_error "Planes cannot land due to bad weather"
    end

    it "should not allow plane to land if full" do
      airport.instance_variable_set(:@planes_in_hangar, [plane])
      expect{ airport.land(plane) }.to raise_error "Planes cannot land due to airport hangar full"
    end

  end

end
