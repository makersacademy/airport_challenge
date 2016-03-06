require_relative "../lib/airport"

heathrow = Airport.new(capacity: 50)
frankfurt = Airport.new(capacity: 70)
schiphol = Airport.new

ba = Plane.new(heathrow)
lufthansa = Plane.new(frankfurt)
klm = Plane.new(schiphol)

describe "Program features" do
  describe "initializing airports" do
    it "has the default capacity" do
      expect(schiphol.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "should accept new capacity" do
      expect(frankfurt.capacity).to eq 70
    end

    it "should accept new capacity" do
      expect(heathrow.capacity).to eq 50
    end
  end

  describe "initializing planes" do
    [ba, lufthansa, klm].each do |plane|
      it "#{plane} starts in the airport" do
        expect(plane.flying).to eq false
      end
    end
  end

  context "no stormy weather" do
    before do
      [schiphol, frankfurt].each do |airport|
        allow(airport.send(:weather)).to receive(:stormy?).and_return(false)
      end
    end

    describe "take-off" do
      it "klm can only take off from the airport it is in" do
        expect { frankfurt.take_off(klm) }.to raise_error
      end

      it "klm takes off and leaves schiphol airport" do
        schiphol.take_off(klm)
        expect(schiphol.planes).not_to include klm
      end

      it "klm cannot take off again once flying" do
        expect { schiphol.take_off(klm) }.to raise_error
      end
    end

    describe "landing" do
      it "klm lands in frankfurt airport" do
        frankfurt.land(klm)
        expect(frankfurt.planes.last).to eq klm
      end

      it "klm cannot land again once landed" do
        expect { frankfurt.land(klm) }.to raise_error
      end

      it "klm cannot land in schiphol due to traffic" do
        frankfurt_to_schiphol = []
        30.times { frankfurt_to_schiphol << (Plane.new(frankfurt)) }
        frankfurt_to_schiphol.each do |plane|
          frankfurt.take_off(plane)
          schiphol.land(plane)
        end
        frankfurt.take_off(klm)
        expect { schiphol.land(klm) }.to raise_error
      end
    end
  end
end
