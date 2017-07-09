require "airport"

describe Airport do
  subject(:gatwick) { described_class.new }
  let(:boeing) { double(:plane, :landed => false) }
  before do
    allow(gatwick).to receive(:good_weather).and_return(true)
  end

  describe "initialization" do
    it "should have a default capacity" do
      expect(gatwick.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "should be able to have a different capacity set" do
      heathrow = described_class.new(50)
      expect(heathrow.capacity).to eq 50
    end
  end

  describe "#change_capacity" do
    it "should allow a user to change the airport's capacity" do
      gatwick.change_capacity(50)
      expect(gatwick.capacity).to eq 50
    end
  end

  describe "#land" do
    before do
      allow(boeing).to receive(:has_landed).and_return(false)
    end

    it "can store multiple planes" do
      boeing1 = double(:plane)
      allow(boeing1).to receive_messages(:has_landed => false, :landed => true)
      boeing2 = double(:plane)
      allow(boeing2).to receive_messages(:has_landed => false, :landed => true)
      gatwick.land(boeing1)
      expect(gatwick.land(boeing2)).to eq [boeing1, boeing2]
    end

    it "should not land a plane when the airport is full" do
      Airport::DEFAULT_CAPACITY.times { gatwick.land(boeing) }
      expect { gatwick.land(boeing) }.to raise_error "Airport is full"
    end

    it "should not allow a plane to land if it has already landed somewhere" do
      gatwick.land(boeing)
      allow(boeing).to receive(:has_landed).and_return(true)
      expect { gatwick.land(boeing) }.to raise_error "Plane has already landed"
    end

    it "should not allow a plane to land in bad weather" do
      allow(gatwick).to receive(:good_weather).and_return(false)
      message = "Poor weather prevents landing"
      expect { gatwick.land(boeing) }.to raise_error message
    end
  end

  describe "#takeoff" do
    before do
      allow(boeing).to receive(:has_landed).and_return(false)
    end

    it "removes the correct plane from the airport" do
      gatwick.land(boeing)
      expect(gatwick.takeoff(boeing)).to eq boeing
    end

    it "should not allow planes to take off from an airport they aren't in" do
      message = "Only planes in an airport can take off from it"
      expect { gatwick.takeoff(boeing) }.to raise_error message
    end

    it "should not allow a plane to take off in bad weather" do
      gatwick.land(boeing)
      allow(gatwick).to receive(:good_weather).and_return(false)
      message = "Poor weather prevents takeoff"
      expect { gatwick.takeoff(boeing) }.to raise_error message
    end
  end

  describe "#in_airport?" do
    before do
      allow(boeing).to receive(:has_landed).and_return(false)
    end

    it "allows the user to check that a landed plane is in the airport" do
      gatwick.land(boeing)
      expect(gatwick.in_airport?(boeing)).to be true
    end

    it "allows the user to check that a plane has taken off" do
      gatwick.land(boeing)
      gatwick.takeoff(boeing)
      expect(gatwick.in_airport?(boeing)).to be false
    end
  end

end
