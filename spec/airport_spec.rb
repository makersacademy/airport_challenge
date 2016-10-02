require "airport"

describe Airport do

  let(:airport) { described_class.new(weather) }
  let(:weather) { double(:weather, :stormy? => false) }
  let(:plane) { double(:plane) }

  describe "#take_off" do
    context "given a plane" do
      it "calls #land on the plane" do
        expect(plane).to receive(:take_off)
        airport.take_off(plane)
      end
    end

    context "once instructed a plane to takeoff" do
      it "removes the plane from the array" do
        allow(plane).to receive(:take_off)
        airport.planes << plane
        airport.take_off(plane)
        expect(airport.planes).not_to include plane
      end
    end

    context "when #stormy? is true" do
      it "raises an error" do
        allow(plane).to receive(:take_off)
        allow(weather).to receive(:stormy?).and_return true
        expect{airport.take_off(plane)}.to raise_error "Cannot takeoff due to stormy weather"
      end
    end
  end

  describe "#land" do
    context "when given a plane" do
      it "instructs the plane to land" do
        # expects plane to have its land method called
        expect(plane).to receive(:land)
        # call the airport.land(plane) to call plane.land
        airport.land plane
      end
    end

    context "once instructed the plane to land" do
      it "adds the plane to the array" do
        allow(plane).to receive(:land)
        airport.land plane
        expect(airport.planes).to include plane
      end
    end

    context "when #stormy? is true" do
      it "raises an error" do
        allow(plane).to receive(:land)
        allow(weather).to receive(:stormy?).and_return true
        expect{airport.land(plane)}.to raise_error "Cannot land due to stormy weather"
      end
    end

    context "when #full? is true" do
      it "raises an error" do
        allow(plane).to receive(:land)
        10.times {airport.land(plane)}
        expect{airport.land(plane)}.to raise_error "Cannot land plane as airport is full"
      end
    end
  end

  context "when instantiated with a capacity value" do
    let(:airport) { described_class.new(weather, 30) }
    it "sets a new capacity value" do
      expect(airport.capacity).to eq 30
    end
  end

end
