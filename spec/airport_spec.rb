require "airport"

describe Airport do
  let(:airplane) {double :airplane}
  let(:airplane1) {double :airplane}
  let(:weather) {double :weather}
  subject(:stormy_airport) { described_class.new}
  subject(:nice_airport) {described_class.new}

  context "NOT STORMY AIRPORT" do
    before do
			allow(nice_airport).to receive(:stormy_at_airport?) { false }
		end

    it "expects an airport class to exist" do
      expect(nice_airport.class).to eq(Airport)
    end

    it "expects airport to only allow 10 airplanes to land by default" do
      expect(nice_airport.airport_capacity).to eq Airport::AIRCRAFT_HANGERS
    end

    it "expects no airplanes to be at the airport by default" do
      expect(nice_airport.airplanes_on_ground).to be_empty
    end

    it "expects airport to respond to a land_at_airport method and pass in a plane" do
      expect(nice_airport).to respond_to(:land_at_airport).with(1).argument
    end

    it "expects a plane in the airplane_on_ground array if a plane has landed" do
      nice_airport.land_at_airport(airplane)
      expect(nice_airport.airplanes_on_ground).to include(airplane)
    end

    it "expects airport to respond to a airport_full? method" do
      expect(nice_airport).to respond_to(:airport_full?)
    end

    it "expects airport to allow as many airplanes to land as the system maintainer sets" do
      airport = Airport.new(40)
      expect(airport.airport_capacity).to eq(40)
    end

    it "expects airport_full to be true if there are as many (or more) airplanes on the ground as there are the airport capacity" do
      nice_airport.airport_capacity.times {nice_airport.land_at_airport(airplane)}
      expect(nice_airport).to be_airport_full
    end

    it "expects an error message if there is no room at the airport" do
      nice_airport.airport_capacity.times {nice_airport.land_at_airport(airplane)}
      expect{(nice_airport.land_at_airport(airplane)).to raise_error("Sorry, airport full. Try somewhere else.")}
    end

    it "expects airport to respond to a take_off method" do
      expect(nice_airport).to respond_to(:take_off)
    end

    it "expects an error message if there are no airples and one tries to take off" do
      expect{(nice_airport.take_off).to raise_error("Sorry, a non existant airplane can not take off.")}
    end

    it "expects an airplane to leave the array when the take_off method is called" do
      nice_airport.land_at_airport(airplane)
      nice_airport.land_at_airport(airplane1)
      expect(nice_airport.take_off).to eq(airplane1)
    end

    it "expects the airplanes_on_ground array to reflect that an airplane has taken off when the take_off method is called" do
      nice_airport.land_at_airport(airplane)
      nice_airport.land_at_airport(airplane1)
      nice_airport.take_off
    end
  end


  context "STORMY AIRPORT" do
    before do
      allow(stormy_airport).to receive(:stormy_at_airport?) { true }
    end
    it "expects an error message if the plane tries to land while it is stormy" do
      expect{(stormy_airport.land_at_airport(airplane)).to raise_error("You can't land in stormy weather!")}
    end
    it "expects an error message if the plane tries to take off in stormy weather" do
      expect{(stormy_airport.take_off).to raise_error("You can't take off in stormy weather!")}
    end
  end
end
