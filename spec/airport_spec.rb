require 'airport'
require 'plane'

describe Airport do
  let(:gatwick) { described_class.new }
  let(:wings) { Plane.new }
  
  context "land" do
    it "instruct a plane to land" do
      expect(gatwick).to respond_to(:land).with(1).argument
    end
    it "land a plane in the airport" do
      allow(gatwick).to receive(:forecast) { "sunny" }
      expect(gatwick.land(wings)).to eq wings
    end
    it "prevent landing when airport is full" do
      allow(gatwick).to receive(:forecast) { "sunny" }
      allow(gatwick).to receive(:full) { true }
      expect { gatwick.land(wings) }.to raise_error("The airport is full, redirecting somewhere else")
    end
  end

  context "take off" do
    it "instruct a plane to take off" do
      expect(gatwick).to respond_to(:departure)
    end
    it "confirms that the plane is no longer in the airport" do
      allow(gatwick).to receive(:forecast) { "sunny" }
      gatwick.land(wings)
      departing_plane = gatwick.landed[0]
      gatwick.departure
      expect(gatwick.landed).not_to include(departing_plane)
    end
  end

  context "airport capacity" do
    it "has a default capacity of 50" do
      expect(Airport::DEFAULT_CAPACITY).to eq 50
    end
    it "can be overriden to other number" do
      stanstead = Airport.new(35)
      expect(stanstead.capacity).to eq 35
    end
    it "report full when reach capacity" do
      allow(gatwick).to receive(:forecast) { "sunny" }
      50.times { gatwick.land(wings) }
      expect(gatwick.full).to eq true
    end
  end

  context "weather" do
    it "prevent take off when weather is stormy" do
      allow(gatwick).to receive(:forecast) { "stormy" }
      expect { gatwick.departure }.to raise_error("Stormy weather, red light for departure")
    end
    it "prevent landing when weather is stormy" do
      allow(gatwick).to receive(:forecast) { "stormy" }
      expect { gatwick.land(wings) }.to raise_error("Stormy weather, red light for landing")
    end
    it "randomly return 'sunny' or 'stormy'" do
      expect(gatwick.forecast).to eq('sunny').or eq('stormy')
    end
  end

end