require "airport"
require 'weather'

describe Airport do

  before(:each) do
    @airport = Airport.new
    @plane = Plane.new
    @home_ap = @plane.location
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
  end

  it "can change capacity" do
    changed_ap = Airport.new(5)
    expect(changed_ap.capacity).to eq(5)
  end

  it "has a default capacity of 10" do
    expect(@airport.capacity).to eq(10)
  end

  describe "#land" do

    it "can land a plane in the airport" do
      @airport.land(@plane)
      expect(@airport.landed_planes).to include(@plane)
    end

    it "does not allow planes to land if at capacity" do
      airport = Airport.new(0)
      expect { airport.land(@plane) }.to raise_error 'The airport is at max capacity'
    end

    it "does not allow planes to land if already landed" do
      @airport.land(@plane)
      expect { @airport.land(@plane) }.to raise_error 'This plane has already landed'
    end

    it "does not allow planes to land if the weather is stormy" do
      @plane.take_off
      allow(@airport.weather).to receive(:stormy?).and_return(true)
      expect { @airport.land(@plane) }.to raise_error 'It is too stormy to land'
    end
  end

  describe "#take_off" do
    it "does not allow planes to take off if the weather is stormy" do
      allow(@home_ap.weather).to receive(:stormy?).and_return(true)
      expect { @home_ap.take_off(@plane) }.to raise_error 'It is too stormy to fly'
    end

    it "doesn't allow planes to take off if they are not in the airport" do
      expect { @airport.take_off(@plane) }.to raise_error 'You are not in this airport'
    end

    it "removes planes from airport upon take off" do
      @home_ap.take_off(@plane)
      expect(@home_ap.landed_planes.count).to eq 0
    end
  end
end
