require 'plane'

describe Plane do

  context "Gives the correct status" do
    it "shows status as 'in the air'" do
      expect(subject.status).to eq "In the air"
    end

    it "shows status as 'in airport' after landing" do
      airport = Airport.new
      allow(airport.weather).to receive(:weather_report) { "sunny" }
      airport.land(subject)
      expect(subject.status).to eq "In airport"
    end
  end

end
