require "airport"

describe Airport do
  subject(:airport) {described_class.new}

    describe "landing" do
      it "enables a plane to land" do
        expect(airport.land(:plane)).to be true
      end

      it "confirms plane has landed" do
       expect(airport.landed?(:plane)).to be true
      end
    end

    describe "take off" do
      it "enables a plane to take off" do
        expect(airport.take_off(:plane)).to be true
      end

      it "confirms plane no longer at airport" do
       expect(airport.departed?(:plane)).to be true
      end
    end
end