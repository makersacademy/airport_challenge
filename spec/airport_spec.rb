require "airport"

describe Airport do
  subject(:gatwick) { described_class.new }
  let(:boeing) { double(:plane) }

  describe "initialization" do
    it "should have a default capacity" do
      expect(gatwick.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "should be able to have a different capacity set" do
      heathrow = described_class.new(50)
      expect(heathrow.capacity).to eq 50
    end
  end

  describe "#land" do
    it "lands planes and stores them" do
      gatwick.land(boeing)
      expect(gatwick.planes.pop).to eq boeing
    end

    it "can store multiple planes" do
      boeing1 = double(:plane)
      boeing2 = double(:plane)
      gatwick.land(boeing1)
      gatwick.land(boeing2)
      expect(gatwick.planes).to eq [boeing1, boeing2]
    end

    it "should not land a plane when the airport is full" do
      Airport::DEFAULT_CAPACITY.times { gatwick.land(double(:plane)) }
      expect { gatwick.land(boeing) }.to raise_error "Airport is full"
    end

    it "should not allow a plane to land if it has already landed" do
      gatwick.land(boeing)
      expect { gatwick.land(boeing) }.to raise_error "Plane has already landed"
    end
  end

  describe "#takeoff" do
    it "removes planes from the airport" do
      gatwick.land(boeing)
      gatwick.takeoff(boeing)
      expect(gatwick.planes).to eq []
    end

    it "should not allow planes to take off from airports they aren't in" do
      heathrow = described_class.new
      gatwick.land(boeing)
      expect { heathrow.takeoff(boeing) }.to raise_error "Only planes in an airport can take off from it"
    end
  end

  describe "#in_airport?" do
    it "allows the user to check that a landed plane is in the airport" do
      gatwick.land(boeing)
      expect(gatwick.in_airport?(boeing)).to be true
    end

    it "allows the user to check that a plane which has taken off is no longer in the airport" do
      gatwick.land(boeing)
      gatwick.takeoff(boeing)
      expect(gatwick.in_airport?(boeing)).to be false
    end
  end

end
