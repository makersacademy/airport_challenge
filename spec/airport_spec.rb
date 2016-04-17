require "airport"

describe Airport do
  subject(:airport) {described_class.new}

    describe "Landing Plane" do
      it "enables a plane to land" do
        expect(subject).to respond_to(:land).with(1).argument
      end

      it "confirms plane has landed" do
       expect(airport.landed?(:plane)).to eq true
      end
    end
end