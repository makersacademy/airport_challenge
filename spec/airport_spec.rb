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
          expect { airport.land(:plane) }.to raise_error "Stormy so cannot land plane"
        end
      end
    end

    describe "#take_off" do
      it "enables a plane to take off" do
        expect(airport.take_off(:plane)).to be true
      end

      it "confirms plane no longer at airport" do
       expect(airport.departed?(:plane)).to be true
      end
    end
end