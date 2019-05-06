require 'plane'
require 'airport'
describe Airport do
  describe "#land" do
    it "instructs plane to land" do
      luton = Airport.new
      plane = Plane.new
      expect(luton.land(false, plane)).to eq('You have permission to land!')
    end

    it "doesn't allow the planes to land due the stormy weather" do
      luton = Airport.new
      plane = Plane.new
      expect { luton.land(true, plane) }.to raise_error "Weather is too stormy"
    end

    it "raises an error when the airport is full" do
      luton = Airport.new
      plane = Plane.new
      50.times { luton.land(false, plane) }
      expect { luton.land(false, plane) }.to raise_error "Airport is full"
    end

  end

  describe "#take_off" do
    it "allows a plane to take off" do
      luton = Airport.new
      plane = Plane.new
      luton.land(false, plane)
      expect(luton.take_off(false, plane)).to eq('You can now take off!')
    end

    it "doesn't allow the planes to take off due the weather" do
      luton = Airport.new
      plane = Plane.new
      expect { luton.land(true, plane) }.to raise_error "Weather is too stormy"
    end
  end
end
