require 'airport'
require 'plane'

describe Airport do

  before(:each) do
    @my_plane = Plane.new
    @my_airport = Airport.new
  end
  
  describe "#airport capacity" do
    it "ensures a default capacity of 20 is set" do
      expect(@my_airport.instance_variable_get(:@capacity)).to eq 5
    end
    
    it "enables user to override airport capacity" do
      another_airport = Airport.new(10)
      expect(another_airport.instance_variable_get(:@capacity)).to eq 10
    end
  end

  describe "#lands planes" do
    it "plane that has landed can be found in the airport" do
      allow(@my_airport.weather).to receive(:stormy?) { false }
      @my_airport.land(@my_plane)
      expect(@my_airport.planes.last).to eq @my_plane
    end

    it "planes that have landed cannot land again" do
      allow(@my_airport.weather).to receive(:stormy?) { false }
      @my_airport.land(@my_plane)
      expect { @my_airport.land(@my_plane) }.to raise_error "Plane is already at airport"
    end

    it "prevents landing when airport is full" do
      allow(@my_airport.weather).to receive(:stormy?) { false }
      5.times { @my_airport.land(Plane.new) }
      expect { @my_airport.land(@my_plane) }.to raise_error "Airport is at full capacity"
    end

    it "prevent landing when weather is stormy" do
      allow(@my_airport.weather).to receive(:stormy?) { true }
      expect { @my_airport.land(@my_plane) }.to raise_error "Weather is too bad"
    end
  end

  describe "#takes off planes" do
    it "after plane takes off, it is no longer at the airport" do
      allow(@my_airport.weather).to receive(:stormy?) { false }
      @my_airport.planes << @my_plane
      @my_airport.take_off(@my_plane)
      expect(@my_airport.planes.length).to eq 0
    end

    it "planes can only take off from airport they are in" do
      another_airport = Airport.new
      allow(another_airport.weather).to receive(:stormy?) { false }
      @my_airport.planes << @my_plane
      expect { another_airport.take_off(@my_plane) }.to raise_error "this plane isn't at the airport"
    end

    it "don't let plane take off if weather is stormy" do
      allow(@my_airport.weather).to receive(:stormy?) { true }
      @my_airport.planes << @my_plane
      expect { @my_airport.take_off(@my_plane) }.to raise_error "Weather is too bad"
    end

    it "planes that are flying cannot take off" do
      allow(@my_airport.weather).to receive(:stormy?) { false }
      @my_airport.planes << @my_plane
      @my_airport.take_off(@my_plane)
      expect { @my_airport.take_off(@my_plane) }.to raise_error "this plane isn't at the airport"
    end
  end
end
