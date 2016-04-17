require "airport"

describe Airport do
  subject(:airport) {described_class.new}

    describe "Landing Plane" do
      it "enables a plane to land" do
        expect(airport.land(:plane)).to eq true
      end

      it "confirms plane has landed" do
       expect(airport.landed?(:plane)).to eq true
      end
    end
end