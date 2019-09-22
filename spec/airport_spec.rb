require 'airport'
require 'plane'

describe Airport do

  describe "checks default" do
    it "checks default capcity of airport is 10" do
      airport = Airport.new
      expect(airport.capacity).to eq 10
    end
  end

  describe "#lands_plane" do

    it { is_expected.to respond_to(:land_plane) }

    it "lands a specific plane" do
      airport = Airport.new
      plane = Plane.new
      allow(airport). to receive(:rand).and_return(2)
      expect(airport.land_plane(plane)).to include plane
    end

    it "allows multiple planes to land" do
      airport = Airport.new
      plane1 = Plane.new
      plane2 = Plane.new
      allow(airport). to receive(:rand).and_return(1)
      airport.land_plane(plane1)
      airport.land_plane(plane2)
      expect(airport.planes).to include(plane1, plane2)
    end

    it "throws error if plane already in airport tries to land" do
      airport = Airport.new
      plane1 = Plane.new
      allow(airport). to receive(:rand).and_return(1)
      airport.land_plane(plane1)
      expect { airport.land_plane(plane1) }.to raise_error "Plane currently in airport"
    end

    it "prevents landing a plane when airport full" do
      airport = Airport.new(1)
      plane1 = Plane.new
      plane2 = Plane.new
      allow(airport). to receive(:rand).and_return(1)
      airport.land_plane(plane1)
      expect { airport.land_plane(plane2) }. to raise_error "Airport full, no space to land"
    end

    it "prevents landing plane when stormy" do
      airport = Airport.new
      plane = Plane.new
      allow(airport). to receive(:rand).and_return(5)
      expect { airport.land_plane(plane) }.to raise_error "Too stormy to land"
    end
  end

  describe "#take_off" do

    it { is_expected.to respond_to(:take_off) }

    it "takes off a specific plane" do
      airport = Airport.new
      plane = Plane.new
      allow(airport). to receive(:rand).and_return(1)
      airport.land_plane(plane)
      airport.take_off(plane)
      expect(airport.planes).to be_empty
    end

    it "throws error if no planes available to take_off" do
      airport = Airport.new
      plane = Plane.new
      allow(airport). to receive(:rand).and_return(1)
      expect { airport.take_off(plane) }.to raise_error "No planes in airport"
    end

    it "throws error if requested plane for take off not in airport" do
      airport = Airport.new
      plane1 = Plane.new
      plane2 = Plane.new
      allow(airport). to receive(:rand).and_return(1)
      airport.land_plane(plane1)
      expect { airport.take_off(plane2) }.to raise_error "Plane not currently in airport"

    end

    it "prevents take off when stormy" do
      airport = Airport.new
      plane = Plane.new
      allow(airport). to receive(:rand).and_return(1)
      airport.land_plane(plane)
      allow(airport). to receive(:rand).and_return(5)
      expect { airport.take_off(plane) }.to raise_error "Too stormy to take off!"
    end

    it "confirms plane has left airport" do
      airport = Airport.new
      plane = Plane.new
      allow(airport). to receive(:rand).and_return(1)
      airport.land_plane(plane)
      expect(airport.take_off(plane)).to eq "#{plane} has left the airport"
    end
  end

# #stormy? made a private function - no longer testable

  # describe "#stormy?" do
  #   it "checks if weather is stormy when rand(1..5) = 5" do
  #     airport = Airport.new
  #     allow(airport). to receive(:rand).and_return(5)
  #     expect(airport.stormy?). to eq true
  #   end
  # end
end
