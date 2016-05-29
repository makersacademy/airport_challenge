require 'airport'
require 'weather'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  # let(:weather) { double :weather}

  describe "#planes" do

    it "responds to planes method" do
      expect(airport).to respond_to(:planes)
    end

    it "lists planes currently landed at airport" do
      allow(airport).to receive(:stormy?).and_return false
      plane1 = Plane.new
      airport.land(plane1)
      plane2 = Plane.new
      airport.land(plane2)
      expect(airport.planes).to eq [plane1, plane2]
    end

  end

  describe "#land" do

    context "when not stormy" do

      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it "responds to land method with 1 argument" do
        expect(airport).to respond_to(:land).with(1).argument
      end

      it "returns planes landed and stored at airport" do
        airport.land(plane)
        expect(airport.planes).to include plane
      end

      context "when full" do

        before do
          allow(airport).to receive(:full?).and_return true
        end

        it "prevents plane landing when airport full" do
          expect { airport.land(plane) }.to raise_error "Cannot land plane: airport is full"
        end

      end

    end

    context "when stormy" do

      before do
        allow(airport).to receive(:stormy?).and_return true
      end

      it "prevents plane landing when stormy" do
        expect { airport.land(plane) }.to raise_error "Cannot land plane: weather is stormy"
      end

    end

  end

  describe "#confirm_landed" do

    it "responds to confirm_landed method with 1 argument" do
      expect(airport).to respond_to(:confirm_landed).with(1).argument
    end

    context "when not stormy" do

      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it "confirms if a landed plane is at the airport" do
        airport.land(plane)
        expect(airport.confirm_landed(plane)).to eq "#{plane} has landed at airport"
      end

    end

    it "confirms if a landed plane is NOT at the airport" do
      expect(airport.confirm_landed(plane)).to eq "#{plane} has not landed at airport"
    end

  end

  describe "#take_off" do

    it "responds to take_off method with 1 argument" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    context "when not stormy" do

      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it "causes plane to leave airport" do
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.planes).to eq []
      end

      it "returns the plane that took-off" do
        airport.land(plane)
        expect(airport.take_off(plane)).to eq plane
      end

      it "raises an error if plane not at airport" do
        another_airport = described_class.new
        allow(another_airport).to receive(:stormy?).and_return false
        another_airport.land(plane)
        expect { airport.take_off(plane) }.to raise_error "Cannot take-off: plane not at this airport"
      end

    end

    context "when stormy" do

      before do
        allow(airport).to receive(:stormy?).and_return true
      end

      it "prevents plane taking-off when stormy" do
        expect { airport.take_off(plane) }.to raise_error "Cannot take-off: weather is stormy"
      end

    end

  end

  describe "#confirm_departed" do

    it "responds to confirm_departed method with 1 argument" do
      expect(airport).to respond_to(:confirm_departed).with(1).argument
    end

    it "confirms if a departed plane has left the airport" do
      allow(airport).to receive(:stormy?).and_return false
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.confirm_departed(plane)).to eq "#{plane} has departed airport"
    end

    it "confirms if a plane has not departed the airport" do
      allow(airport).to receive(:stormy?).and_return false
      airport.land(plane)
      expect(airport.confirm_departed(plane)).to eq "#{plane} has not departed airport"
    end

  end

  describe "#capacity" do

    it "returns the capacity of the airport" do
      expect(airport).to respond_to(:capacity)
    end

    it "has default capacity on initialization" do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "default capacity can be overriddden at initialization" do
      airport = Airport.new(50)
      expect(airport.capacity).to eq 50
    end

    it "capacity (default or custom) can be overridden at anytime" do
      expect(airport.capacity = 50).to eq 50
    end

  end


end