require 'airport'

describe '#airport' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  describe "#land" do
    it "accepts with #land method and takes 1 argument" do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it "stores the landed plane in the hangar array" do
      airport.land(plane)
      expect(airport.hangar).to include(plane)
    end
  end

  describe "#take_off" do
    it "interacts with #land method and take 1 argument" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end
end
