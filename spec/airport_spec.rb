require "airport"

describe Airport do
  subject(:airport) {described_class.new}

    describe "#land" do
      it "confirms plane has landed" do
       expect(airport.landed?(:plane)).to be true
      end

      context "weather" do
        it "raises an error if weather is stormy" do
          allow(airport).to receive(:stormy?).and_return true
          expect { airport.land(:plane) }.to raise_error "Stormy cannot land"
        end

        it "can land if not stormy" do
          allow(airport).to receive(:stormy?).and_return false
          expect(airport.land(:plane)).to be true
        end
      end
    end

    describe "#take_off" do

      it "confirms plane no longer at airport" do
       expect(airport.departed?(:plane)).to be true
      end

      context "weather" do
        it "raises an error if weather is stormy" do
          allow(airport).to receive(:stormy?).and_return true
          expect { airport.take_off(:plane) }.to raise_error "Cannot take off"
        end

        it "can take off if not stormy" do
          allow(airport).to receive(:stormy?).and_return false
          expect(airport.take_off(:plane)).to be true
        end
      end
    end

    describe "#stormy" do
      it "can be stormy" do
      allow(airport).to receive(:stormy?).and_return true
      expect(airport.stormy?(:plane)).to be true
    end

      it "can be not stormy" do
      allow(airport).to receive(:stormy?).and_return false
      expect(airport.stormy?(:plane)).to be false
    end
  end
end