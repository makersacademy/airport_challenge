require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

  let (:plane) { double :plane, land: nil, takeoff: nil }
  let (:weather) { double :weather, stormy?: false}
  
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
      airport.instance_variable_set(:@planes_in_hangar, [plane]) # add plane to hangar for takeoff
      allow(plane).to receive(:flying?).and_return(true)
    }

    it "should instruct plane to take off" do
      expect(plane).to receive(:takeoff)
      airport.takeoff(plane)
    end

    it "airport shouldn't have plane after takeoff" do
      expect(airport.takeoff(plane)).to be plane
    end

    it "should raise error plane if plane did not take off" do
      allow(plane).to receive(:flying?).and_return(false)
      expect { airport.takeoff(plane) }.to raise_error "Plane did not take off"
    end

    it "should raise error if plane isn't at this airport" do
      airport.instance_variable_set(:@planes_in_hangar, [])
      expect { airport.takeoff(plane) }.to raise_error "Plane is not in this airport"
    end

    it "should not allow plane to take off if stormy" do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.takeoff(plane) }.to raise_error "Planes cannot take off due to bad weather"
    end

  end

  describe "#land_plane" do

    before { 
      airport.instance_variable_set(:@weather, weather) 
      allow(plane).to receive(:flying?).and_return(false)
    }

    it "should instruct plane to land" do
      expect(plane).to receive(:land)
      airport.land(plane)
    end

    it "airport should have plane after landing" do
      # use return value from method rather than examining internal object state
      expect(airport.land(plane)).to include plane
    end

    it "should raise error plane if plane did not land" do
      allow(plane).to receive(:flying?).and_return(true)
      expect { airport.land(plane) }.to raise_error "Plane did not land"
    end

    it "should not allow plane to land if stormy" do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.land(plane) }.to raise_error "Planes cannot land due to bad weather"
    end

    it "should not allow plane to land if full" do
      full_hangar = Array.new(airport.capacity, plane) # create a hangar full of planes
      airport.instance_variable_set(:@planes_in_hangar, full_hangar)
      expect { airport.land(plane) }.to raise_error "Planes cannot land due to airport hangar full"
    end

  end

end
