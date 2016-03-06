require 'airport'
require 'plane'

heathrow = Airport.new
gatwick = Airport.new

describe "Feature Test" do
  describe "rspec feature test" do
    it "Land 20 planes at Heathrow" do
      20.times{
        plane = Plane.new
        allow(plane).to receive(:storm_check){false}
        plane.land(heathrow)
        }
      expect(heathrow.planes.length).to eq(20)
    end

    it "Changes the capacity of Gatwick" do
      gatwick.capacity = 3
      expect(gatwick.capacity).to eq(3)
    end

    it "Can't land a plane at Luton" do
      plane = Plane.new
      luton = Airport.new(0)
      allow(plane).to receive(:storm_check){false}
      expect{plane.land(luton)}.to raise_error("Cannot land if airport is full.")
    end
  end
end
