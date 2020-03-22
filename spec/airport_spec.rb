require './lib/airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }
  let(:plane2) { double :plane2 }
  let(:plane3) { double :plane3 }

  describe ".new" do
    it "@plane = [], creates planes array" do
      expect(airport.planes).to eq([])
    end
  end

# ------------------------------------------------------------------------------
  describe "#land" do
    it "responds to #land(plane)" do
      expect(airport).to respond_to(:land).with(1).argument
    end

    context "airport not at capacity" do
      it "@plane = [plane], plane lands at airport" do
        airport.land(plane)
        expect(airport.planes).to eq([plane])
      end

      it "@plane = [plane2, plane, plane3], many planes land at airport" do
        airport.land(plane2)
        airport.land(plane)
        airport.land(plane3)
        expect(airport.planes).to eq([plane2, plane, plane3])
      end
    end

    context "airport at capacity" do
      before { 10.times { airport.land(plane2) } }

      it "raise_error, Cannot land - airport at capacity!" do
        expect { airport.land(plane) }.to raise_error("Cannot land - airport at capacity!")
        p airport.planes
      end
    end
  end

# ------------------------------------------------------------------------------
  describe "#take_off" do
    it "responds to #take_off(plane)" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    context "with plane" do
      before { airport.planes.push(plane) }

      context "no other planes" do
        it "@planes = [], plane has taken off" do
          airport.take_off(plane)
          expect(airport.planes).to eq([])
        end
      end

      context "with other planes" do
        before { airport.planes.unshift(plane2) }
        before { airport.planes.push(plane3) }

        it "@planes = [plane2, plane3], plane has taken off" do
          airport.take_off(plane)
          expect(airport.planes).to eq([plane2, plane3])
        end
      end
    end

    context "without plane" do

      context "no other planes" do
        it "raise_error, Plane not at airport!" do
          expect { airport.take_off(plane) }.to raise_error("Plane not at airport!")
        end
      end

      context "with other planes" do
        before { airport.planes.unshift(plane2) }
        before { airport.planes.push(plane3) }

        it "raise_error, Plane not at airport!" do
          expect { airport.take_off(plane) }.to raise_error("Plane not at airport!")
        end
      end
    end
  end

# ------------------------------------------------------------------------------
  describe "#plane_at_airport?" do
    it "responds to #plane_at_airport?" do
      expect(airport).to respond_to(:plane_at_airport?).with(1).argument
    end

    context "with plane" do
      before { airport.planes.push(plane) }

      context "no other planes" do
        it "true, plane is at airport" do
          expect(airport.plane_at_airport?(plane)).to be true
        end
      end

      context "with other planes" do
        before { airport.planes.unshift(plane2) }
        before { airport.planes.push(plane3) }

        it "true, plane is at airport" do
          expect(airport.plane_at_airport?(plane)).to be true
        end
      end
    end

    context "without plane" do
      context "no other planes" do
        it "false, plane is not at airport" do
          expect(airport.plane_at_airport?(plane)).to be false
        end
      end

      context "with other planes" do
        before { airport.planes.unshift(plane2) }
        before { airport.planes.push(plane3) }

        it "false, plane is not at airport" do
          airport.land(plane2)
          airport.land(plane3)
          expect(airport.plane_at_airport?(plane)).to be false
        end
      end
    end
  end

# ------------------------------------------------------------------------------
end
