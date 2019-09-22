require 'airport'

describe Airport do
  describe "#land" do
    it "instructs plane to land at the airport" do
      gatwick = Airport.new
      allow(gatwick).to receive(:safe_to_fly?).and_return(true)
      plane_1 = Plane.new
      expect(gatwick.land(plane_1)).to eq "roger wilko"
    end
    it "prevents landing if airport full" do
      gatwick = Airport.new
      allow(gatwick).to receive(:safe_to_fly?).and_return(true)
      20.times { gatwick.land(Plane.new) }
      my_plane = Plane.new
      expect { gatwick.land(my_plane) }.to raise_error "At capacity"
    end
    it "prevents landing if weather is stormy" do
      gatwick = Airport.new
      plane_1 = Plane.new
      allow(gatwick).to receive(:safe_to_fly?).and_return(false)
      gatwick.update_forecast 
      expect { gatwick.land(plane_1) }.to raise_error "Permission denied due to weather"
    end
  end

  describe "#take_off" do
    it "instructs a plane to take_off and returns confirmation" do
      gatwick = Airport.new
      allow(gatwick).to receive(:safe_to_fly?).and_return(true)
      plane_1 = Plane.new
      gatwick.land(plane_1)
      expect(gatwick.take_off(plane_1)).to eq "In the air"
    end

    it "it raises error if plane not at that airport" do
      gatwick = Airport.new
      allow(gatwick).to receive(:safe_to_fly?).and_return(true)
      heathrow = Airport.new
      plane_1 = Plane.new
      gatwick.land(plane_1)
      expect { heathrow.take_off(plane_1) }.to raise_error "No such plane"
    end
  end
end
