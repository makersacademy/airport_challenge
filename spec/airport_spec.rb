require 'Airport'

RSpec.describe Airport do

  airport = Airport.new

  describe "#land" do
    it "checks that it responds to land" do
      expect(airport).to respond_to (:land)
    end

    it "instructs a plane to land at airport" do
      plane = Plane.new
      expect(airport.land(plane)).to eq plane
    end

    it "prevents landing when airport full" do
      plane = Plane.new
      expect { airport.land(plane) }.to raise_error 'Airport is full'
    end
  end

  describe "#take_off" do
    it "instructs plane to take off and confirm that it is" do
      plane = Plane.new
      expect(airport.take_off(plane)).to eq true
    end
  end

  describe "#capacity" do
    it "gives a default airport capacity that can be overridden as appropriate" do
      expect(airport.capacity).to eq 10
      airport.capacity = 20
      expect(airport.capacity).to eq 20
    end

    it "can be used for multiple airports" do
      airport2 = Airport.new
      airport2.capacity = 30
      airport3 = Airport.new
      expect(airport2.capacity).to eq 30
      expect(airport.capacity).to eq 20
      expect(airport3.capacity).to eq 10
    end
  end


end
