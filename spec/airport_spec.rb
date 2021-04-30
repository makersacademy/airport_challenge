require 'airport'
require 'weather'

describe Airport do
  subject(:airport) { described_class.new(10, weather) }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  describe "#Land" do
    context "When weather is not stormy" do
      before do
        allow(weather).to receive(:stormy?).and_return false
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
        allow(weather).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error "Plane cannot land during stormy conditions!"
      end
    end

    describe "#Take off" do
      context "When weather is not stormy" do
        it "Instructs a plane to take_off" do
          expect(airport).to respond_to(:take_off).with(1).argument
        end
      end

      context "When weather is stormy" do
        before do
          allow(weather).to receive(:stormy?).and_return true
        end
        it "Raises an error" do
          expect { airport.take_off(plane) }.to raise_error "Plane cannot take off during stormy conditions!"
        end
      end
    end
  end

end
