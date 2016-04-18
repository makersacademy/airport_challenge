require "airport"
require "plane"

describe Airport do
  subject(:airport)   {described_class.new(100)}
  let(:plane)         {double(:plane)}

    describe "initialize" do
      it "allow the capcity to be set" do
        newairport = Airport.new(20)
        expect(newairport.capacity).to eq 20
      end
    end

    describe "#land" do
      it "confirms plane has landed" do
        allow(airport).to receive(:stormy?).and_return false
        airport.land(plane)
        expect(airport.planes).to include plane
      end

      context "weather" do
        it "cannot land when stormy" do
          allow(airport).to receive(:stormy?).and_return true
          expect { airport.land(plane) }.to raise_error "Stormy cannot land"
        end

        it "can land when not stormy" do
          allow(airport).to receive(:stormy?).and_return false
          expect(airport.land(plane)).to include plane
        end
      end

      context "capacity" do
        it "raises an error" do
          allow(airport).to receive(:stormy?).and_return false
          100.times { airport.land(plane) }
          full = "Airport full"
          expect { airport.land(plane) }.to raise_error full
        end
      end
    end

    describe "#take_off" do
      context "weather" do
        it "raises an error if weather is stormy" do
          allow(airport).to receive(:stormy?).and_return true
          expect { airport.take_off }.to raise_error "Cannot take off"
        end

        it "can take off if not stormy" do
          allow(airport).to receive(:stormy?).and_return false
          airport.land(plane)
          expect(airport.take_off).to be plane
        end
      end
    end
end