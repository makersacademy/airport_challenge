require 'airport'

describe Airport do
  subject(:airport) { described_class.new(10) }
  let(:plane) { double :plane }

  describe "#Land" do
    context "When weather is not stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it "Instructs a plane to land" do
        expect(airport).to respond_to(:land).with(1).argument
      end

      context "When airport is full" do
        it "Raises an error" do
          10.times do
            airport.land(plane)
          end
          expect { airport.land(plane) }.to raise_error "Plane cannot land at a full airport!"
        end
      end
    end

    context "When weather is stormy" do
      it "raises an error" do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error "Plane cannot land during stormy conditions!"
      end
    end
    describe "#Take off" do
      it "Instructs a plane to take_off" do
        expect(airport).to respond_to(:take_off).with(1).argument
      end
    end
  end

end
