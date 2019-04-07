require 'plane'

describe Plane do
  context "when sunny" do
    let(:forecast) { "sunny" }

    it "is expected to land at airport without error" do
      expect { subject.land_at(Airport.new, forecast) }.not_to raise_error
    end
    it "expects the plane to be in the airport hanger" do
      airport = Airport.new
      subject.land_at(airport, forecast)
      expect(airport.hanger).to eq [subject]
    end
  end
end
