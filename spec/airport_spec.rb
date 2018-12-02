require 'airport'
require 'plane'

describe "#airport" do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  context "#land" do
    it "accepts land method and takes 1 argument" do
      allow(weather).to receive(:stormy).and_return(false)
      expect(airport).to respond_to(:land).with(1).argument
    end

    it "stores the landed plane in the hangar array" do
      allow(airport).to receive(:conditions).and_return(false)
      airport.land(plane)
      expect(airport.hangar).to include(plane)
    end

    context "stormy weather" do
      it "will not allow a plane to #land when it's stormy" do
        allow(airport).to receive(:stormy?).and_return(true)
        allow(airport).to receive(:full?).and_return(false)
        expect { airport.land(plane) }.to raise_error "The plane cannot land"
      end
    end

    context "airport hangar is full" do
      it "will not allow a plane to land" do
        allow(airport).to receive(:stormy?).and_return(false)
        1.times{ airport.land(plane) }
        expect{ airport.land(plane) }.to raise_error "The plane cannot land"
      end
    end
  end

  describe "#take_off" do
    it "accepts with #land method" do
      expect(airport).to respond_to(:take_off)
    end

    context "fair weather" do
      it "#take_off removes a plane from the hangar array" do
        allow(airport).to receive(:conditions).and_return(false)
        airport.land(plane)
        airport.take_off
        expect(airport.hangar).not_to include(plane)
      end
    end

    context "stormy weather" do
      it "will not allow #take_off if it is stormy" do
        allow(airport).to receive(:conditions).and_return(true)
        allow(airport.hangar).to receive(:plane)
        expect{ airport.take_off }.to raise_error "It is too stormy to fly"
      end
    end
  end
end
