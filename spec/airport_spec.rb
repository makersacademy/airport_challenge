require "./lib/airport"
require "./lib/plane"

describe Airport do
  subject(:airport) { described_class.new(10) }
  let(:plane) { double :plane }

  describe "#land" do
    context "when not stormy" do
      before do
        # allow the airport to receive stormy and return false - it's not stormy
        allow(airport).to receive(:stormy?).and_return false
      end

      it "should land the plane at the airport" do
        expect(airport).to respond_to(:land).with(1).argument
      end

      context "when airport is full" do
        it "raises an error" do
          10.times do
            airport.land(plane)
          end
          expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full"
        end
      end
    end
    context "when weather is stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return true
      end
      it "does not allow planes to land" do
        expect { airport.land(plane) }.to raise_error "Cannot land plane because it is stormy"
      end
    end
  end

  describe "#take_off" do
    context "when not stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end
      it "instructs plane to take off from the airport" do
        expect(airport).to respond_to(:take_off).with(1).argument
      end
    end
    context "when stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return true
      end
      it "does not allow planes to take off" do
        expect { airport.take_off(plane) }.to raise_error "Cannot take off plane because it is stormy"
      end
    end
  end

  # context "default" do
  #   # subject(:default_airport) { described_class.new(capacity) }
  #   it "has a default capacity" do
  #     default_airport = described_class.new(capacity)
  #     allow(default_airport).to receive(:stormy?).and_return false
  #     described_class::DEFAULT_CAPACITY.times { default_airport.land(plane) }
  #     expect { default_airport.land(plane) }.to raise_error "Cannot land plane: airport full"
  #   end
  # end
end
