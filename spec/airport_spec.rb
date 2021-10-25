require "airport"

describe Airport do
  subject(:airport) { described_class.new(weather, 30) }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  describe "#land" do
    context "when not stormy" do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end

      it "lands at an airport" do
        expect(airport).to respond_to(:land).with(1).argument
      end
    
      context "when full" do
        it "not allow landing when capacity is full" do  
          30.times do
            airport.land(plane)
          end
          expect { airport.land(plane).to raise_error "Cannot land, airport is full!!" }
        end
      end
    end

    context "when stormy" do
      it "raises an error" do
        allow(weather).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error "Cannot land, weather is stormy"
      end
    end
  end

  describe "#take_off" do
    context "when not story" do
      before do
        allow(weather).to receive(:stormy?).and_return true
      end

      it "take off from an airport and confirm that it is no longer in the airport" do
        expect(airport).to respond_to(:take_off).with(1).argument
      end

      it "raises an error if plane is not at this airport" do
        other_airport = described_class.new(weather, 30)
        other_airport.land(plane)
        expect { airport.take_off(plane) }.to raise_error "Cannot take off, plane not at the right airport"
      end
    end

    context "when stormy" do
      before do
        allow(weather).to receive(:stormy?).and_return true
      end

      it "raises an error when stormy" do
        expect { airport.take_off(plane) }.to raise_error "Cannot take off plane, the weather is stormy"
      end
    end
  end

  describe ".initialize" do #context "defaults" do
    subject(:default_airport) { described_class.new(weather) }

    it "has a default capacity" do
      allow(weather).to receive(:stormy?).and_return false
      described_class::DEFAULT_CAPACITY.times { default_airport.land(plane) }
      expect { default_airport.land(plane) }.to raise_error "Cannot land plane as the airport is full"
    end
  
  end

  describe "#take_off" do
    context "when not stormy" do
      it "instructs a plane to take off" do
        expect(airport).to respond_to(:take_off).with(1).argument
      end
    end
  
    context "when stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return true
      end
    end

    it "raises an error" do
      expect { airport.take_off(plane) }.to raise_error "Cannot take off, weather is stormy"
    end
  end
end