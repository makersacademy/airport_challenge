require 'plane'

describe Plane do
  context "when not stormy" do
    let(:forecast) { "sunny" }
    let(:airport) { Airport.new }

    it "prevents landing if airport is at full capacity" do
      airport.hangar << Plane.new << Plane.new
      expect(subject.land_at(airport, forecast)).to eq "Landing prevented: airport is at full capacity"
    end
    it "is expected to land at airport without error" do
      expect { subject.land_at(airport, forecast) }.not_to raise_error
    end
    it "expects the plane to be in the airport hangar" do
      subject.land_at(airport, forecast)
      expect(airport.hangar).to eq [subject]
    end
  end

  context "when stormy" do
    let(:forecast) { "stormy" }
    let(:airport) { Airport.new }

    it "landing is prevented" do
      expect(subject.land_at(airport, forecast)).to eq "Landing prevented due to stormy weather"
    end
  end
end
