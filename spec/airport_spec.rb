require "airport"

describe Airport do
  let(:airplane) {double :airplane}
  let(:airplane1) {double :airplane}
  subject(:airport) {described_class.new}

  context "AIRPORT SETUP" do
    it "expects an airport class to exist" do
      expect(airport.class).to eq(Airport)
    end

    it "expects no airplanes to be at the airport by default" do
      expect(airport.airplanes_on_ground).to be_empty
    end

    it "expects airport to only allow 10 airplanes to land by default" do
      expect(airport.airport_capacity).to eq Airport::AIRCRAFT_HANGERS
    end

    it "expects capacity to be adjustable" do
      airport = Airport.new(40)
      expect(airport.airport_capacity).to eq(40)
    end
  end


  context "NOT STORMY AIRPORT" do
    before do
      allow(airport).to receive(:stormy_at_airport?).and_return(false)
      allow(airplane).to receive(:landed) {true}
    end

    it "expects a plane in the airplane_on_ground array if a plane has landed" do
      airport.land_at_airport(airplane)
      expect(airport.airplanes_on_ground).to include(airplane)
    end

    it "expects an error message if there is no room at the airport" do
      airport.airport_capacity.times {airport.land_at_airport(airplane)}
      expect{(airport.land_at_airport(airplane)).to raise_error("Sorry, airport full. Try somewhere else.")}
    end

    it "expects an error message if there are no airples and one tries to take off" do
      expect{(airport.take_off).to raise_error("Sorry, a non existant airplane can not take off.")}
    end
  end

  context "STORMY AIRPORT" do
    before do
      allow(airport).to receive(:stormy_at_airport?).and_return(true)
    end
    it "expects an error message if the plane tries to land while it is stormy" do
      expect{(airport.land_at_airport(airplane)).to raise_error("You can't land in stormy weather!")}
    end
    it "expects an error message if the plane tries to take off in stormy weather" do
      expect{(airport.take_off).to raise_error("You can't take off in stormy weather!")}
    end
  end
end
