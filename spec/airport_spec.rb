require 'airport'
require 'plane'
require 'weather'

describe Airport do

  describe "#land" do

    it "should land the plane at the airport" do
      airport = Airport.new
      plane = Plane.new
      allow(Weather).to receive(:stormy?).and_return(false)
      expect(airport.land(plane)).to eq "Plane has been landed"
    end

    # This test now obsolete due to later initialize test ?
    it "should not land when the airport is full" do
      airport = Airport.new
      allow(Weather).to receive(:stormy?).and_return(false)
      Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
      plane = Plane.new
      expect { airport.land(plane) }.to raise_error "That airport is full, cannot land"
    end

    it "should prevent landing when the weather is stormy" do
      airport = Airport.new
      plane = Plane.new
      allow(Weather).to receive(:stormy?).and_return(true)
      expect { airport.land(plane) }.to raise_error "Weather is stormy, cannot land"
    end

    it "should not land when the plane is already landed" do
      airport = Airport.new
      allow(Weather).to receive(:stormy?).and_return(false)
      plane = Plane.new
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error "That plane is already on land"
    end

  end

  describe "#take_off" do

    it "should have the plane take off from the airport" do
      airport = Airport.new
      plane = Plane.new
      allow(Weather).to receive(:stormy?).and_return(false)
      airport.land(plane)
      expect(airport.take_off(plane)).to eq "Plane has taken off"
    end

    it "should prevent takeoff when the weather is stormy" do
      airport = Airport.new
      plane = Plane.new
      allow(Weather).to receive(:stormy?).and_return(false, true)
      airport.land(plane)
      expect { airport.take_off(plane) }.to raise_error "Weather is stormy, cannot takeoff"
    end

    it "should prevent takeoff if the plane is not in the airport" do
      airport = Airport.new
      airport_2 = Airport.new
      plane = Plane.new
      allow(Weather).to receive(:stormy?).and_return(false)
      airport_2.land(plane)
      expect { airport.take_off(plane) }.to raise_error "That plane is in a different airport"
    end

    it "should prevent takeoff if the plane is already flying" do
      airport = Airport.new
      plane = Plane.new
      allow(Weather).to receive(:stormy?).and_return(false)
      airport.land(plane)
      airport.take_off(plane)
      expect { airport.take_off(plane) }.to raise_error "That plane is in flight"
    end

  end

  describe "initialize" do

    it "should set default airport capacity" do
      airport = Airport.new
      allow(Weather).to receive(:stormy?).and_return(false)
      Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
      plane = Plane.new
      expect { airport.land(plane) }.to raise_error "That airport is full, cannot land"
    end

    it "should override default airport capacity upon creation" do
      override_capacity = 10
      airport = Airport.new(override_capacity)
      allow(Weather).to receive(:stormy?).and_return(false)
      override_capacity.times { airport.land(Plane.new) }
      plane = Plane.new
      expect { airport.land(plane) }.to raise_error "That airport is full, cannot land"
    end

  end

  describe "#capacity" do

    it "should override default airport capacity at any point after creation" do
      airport = Airport.new
      airport.capacity = 5
      allow(Weather).to receive(:stormy?).and_return(false)
      5.times { airport.land(Plane.new) }
      plane = Plane.new
      expect { airport.land(plane) }.to raise_error "That airport is full, cannot land"
    end

  end

end
