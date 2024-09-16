require "plane"

describe Plane do
  describe "#land" do 
    it "lands plane if hangar has space" do
      plane = Plane.new("plane1")

      expect(plane.land("plane1")).to eq ["plane1"]
    end
    
    it "returns error if aeroport.space? is false" do 
      plane = Plane.new("plane1")

      plane.land("plane.1")
      expect { plane.land("plane") }.to raise_error("No space!")
    end
  end

  describe "#take_off" do
    it "takes off if plane is in hangar" do
      plane = Plane.new("plane")
      plane.land("plane")
      expect(plane.take_off("plane")).to eq []

    end
    it "raises an issue if plane not in hangar" do
      plane = Plane.new("plane")
      plane.land("plane")
      plane.take_off("plane")
      expect { plane.take_off("plane 6") }.to raise_error("Plane not present")
    end
  end

  describe "#takeoff_confirmation" do
    it 'confirms take off' do
      plane = Plane.new("plane")
      plane.land("plane 1")
      plane.take_off("plane 1")
      expect(plane.takeoff_confirmation).to eq "Plane has taken off"
    end

  end
end
