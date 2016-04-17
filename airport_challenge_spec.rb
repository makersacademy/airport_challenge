require "./lib/airport"
require "./lib/plane"
require "./lib/weather"

describe "Airport Challenge" do

  describe "Planes" do
    it "Planes are not at an airport when created" do
      #GIVEN I have a new plane
      plane = Plane.new
      #WHEN I check the planes status
      #THEN The plane is flying
      expect(plane.flying?).to eq true
    end
  end

  describe "Airports" do
    it "Airports are empty when created" do
      #GIVEN I have a new airport
      airport = Airport.new
      #WHEN I check what planes the airport contains
      #THEN The airport is empty
      expect(airport.instance_variable_get(:@planes)).to be_empty
    end
  end

  describe "Weather" do
    it "Can be stormy or not stormy" do
      #GIVEN I have an airport
      airport = Airport.new
      #WHEN I check if the weather is stormy
      #THEN I expect the weather to be stormy or not stormy
      expect([true,false]).to include airport.stormy?
    end
  end

  context "Landing a plane at an airport" do
    it "Airports check the weather when accepting a plane" do
      #GIVEN I have a flying plane and an airport
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:stormy?) { false }
      #WHEN I ask the airport to release the plane
      #THEN I expect the airport to check the weather
      expect(airport).to receive :stormy?
      airport.accept plane
    end
    context "In clear weather" do
      it "Airports can accept planes" do
        #GIVEN I have an airport and a plane
        airport = Airport.new
        plane = Plane.new
        allow(airport).to receive(:stormy?) { false }
        #WHEN I ask the airport to accept the plane
        airport.accept plane
        #THEN I expect the plane to be stored in the airport
        expect(airport.instance_variable_get(:@planes)).to include plane
      end
      it "Planes stop flying when accepted by an airport" do
        #GIVEN I have an airport and a plane that is flying
        airport = Airport.new
        plane = Plane.new
        allow(airport).to receive(:stormy?) { false }
        #WHEN I tell the airport to accept the plane
        airport.accept plane
        #THEN I expect the plane to not be flying
        expect(plane).not_to be_flying
      end
      it "Airports can only accept flying planes" do
        #GIVEN I have an airport and a plane that is not flying
        airport = Airport.new
        plane = Plane.new
        allow(airport).to receive(:stormy?) { false }
        airport.accept plane
        #WHEN I ask the airport to accept the plane
        #THEN I expect an error
        expect { airport.accept plane }.to raise_error Airport::AcceptErr
      end
    end
    context "In stormy weather" do
      it "Airports cannot accept planes" do
        #GIVEN I have a plane and an airport
        airport = Airport.new
        plane = Plane.new
        allow(airport).to receive(:stormy?) { true }
        #WHEN I ask the airport to accept the plane
        #THEN I expect an error
        expect { airport.accept plane }.to raise_error Airport::StormErr
      end
      it "Prioritises invalid planes over stormy weather" do
        #GIVEN I have an plane already at an airport
        airport = Airport.new
        plane = Plane.new
        allow(airport).to receive(:stormy?) { true }
        plane.instance_variable_set(:@flying, false)
        #WHEN I ask the airport to accept the plane
        #THEN I get the invalid plane error, rather than the weather error
        expect { airport.accept plane }.to raise_error Airport::AcceptErr
      end
    end
  end

  context "Having a plane leave an airport" do
    it "Airports check the weather when releasing a plane" do
      #GIVEN I have a plane that is in an airport
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:stormy?) { false }
      airport.instance_variable_set(:@planes, [plane])
      plane.instance_variable_set(:@flying, false)
      #WHEN I ask the airport to release the plane
      #THEN I expect the airport to check the weather
      expect(airport).to receive :stormy?
      airport.release plane
    end
    context "In clear weather" do
      it "Airports can release planes" do
        #GIVEN I have a plane that is in an airport
        airport = Airport.new
        plane = Plane.new
        allow(airport).to receive(:stormy?) { false }
        airport.instance_variable_set(:@planes, [plane])
        plane.instance_variable_set(:@flying, false)
        #WHEN I ask the airport to release the plane
        airport.release plane
        #THEN The plane is no longer in the airport
        expect(airport.instance_variable_get(:@planes)).not_to include plane
      end
      it "Planes start flying when released by an airport" do
        #GIVEN I have a plane that is in an airport
        airport = Airport.new
        plane = Plane.new
        allow(airport).to receive(:stormy?) { false }
        airport.instance_variable_set(:@planes, [plane])
        plane.instance_variable_set(:@flying, false)
        #WHEN I ask the airport to release the plane
        airport.release plane
        #THEN I expect the plane to be flying
        expect(plane).to be_flying
      end
      it "Airports can only release planes that they contain" do
        #GIVEN I have an airport and a plane not at that airport
        airport = Airport.new
        plane = Plane.new
        allow(airport).to receive(:stormy?) { false }
        #WHEN I ask the airport to release the plane
        #THEN I expect an error
        expect { airport.release plane }.to raise_error Airport::ReleaseErr
      end
    end
    context "In stormy weather" do
      it "Airports cannot release planes" do
        #GIVEN I have a plane in an airport
        airport = Airport.new
        plane = Plane.new
        allow(airport).to receive(:stormy?) { true }
        airport.instance_variable_set(:@planes, [plane])
        plane.instance_variable_set(:@flying, false)
        #WHEN I ask the airport to release the plane
        #THEN I expect an error
        expect { airport.release plane }.to raise_error Airport::StormErr
      end
      it "Prioritises missing planes over stormy weather" do
        #GIVEN I have an plane not at an airport
        airport = Airport.new
        plane = Plane.new
        allow(airport).to receive(:stormy?) { true }
        #WHEN I ask the airport to release the plane
        #THEN I get the no plane error, rather than the weather error
        expect { airport.release plane }.to raise_error Airport::ReleaseErr
      end
    end
  end
end
