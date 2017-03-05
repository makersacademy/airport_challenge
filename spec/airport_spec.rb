require 'airport'

describe Airport do
  subject(:airport) {Airport.new}

  describe "#land" do
    it { is_expected.to respond_to(:land)}
    it { is_expected.to respond_to(:land).with(1).argument }

    it "stores the planes that are currently at the airport" do
      plane = Plane.new
      airport.weather.stormy = false
      airport.land(plane)
      expect(airport.arrivals).to include(plane)
    end

    context "calling #land when plane isn't flying" do
      it "will raise an error when plane is already on the ground" do
        plane = Plane.new
        airport.weather.stormy = false
        airport.land(plane)
        expect {airport.land(plane)}.to raise_error(RuntimeError, "The plane is already on the ground!")
      end
    end

    context "calling #land when weather is stormy" do
      it "will not allow for flights to land during stormy conditions" do
        plane = Plane.new
        airport.weather.stormy = true
        expect {airport.land(plane)}.to raise_error
      end
    end

    context "calling #land when airport is under capacity" do
      it "allows for up to 20 planes to land at the airport when capacity is set to 20" do
        airport.weather.stormy = false
        19.times {airport.land(Plane.new)}
        expect {airport.land(Plane.new)}.not_to raise_error
      end
    end

    context "calling #land when airport is at capacity" do
      it "will not allow more than 20 planes to land at the airport when capacity is set at 20" do
        airport.weather.stormy = false
        20.times {airport.land(Plane.new)}
        expect {airport.land(Plane.new)}.to raise_error
      end
    end
  end

  describe "#depart" do
    it { is_expected.to respond_to(:depart)}
    it { is_expected.to respond_to(:depart).with(1).argument }

    it "removes the departed plane from the list of arrivals following take-off" do
      plane = Plane.new
      airport.weather.stormy = false
      airport.land(plane)
      airport.depart(plane)
      expect(airport.arrivals).not_to include(plane)
    end

    it "retains a list of the departed flights" do
      plane = Plane.new
      airport.weather.stormy = false
      airport.land(plane)
      airport.depart(plane)
      expect(airport.departures).to include(plane)
    end

    context "calling depart when the plane has already left the airport" do
      it "raises an error when depart called if plane has already left" do
        plane = Plane.new
        airport.weather.stormy = false
        airport.land(plane)
        airport.weather.stormy = false
        airport.depart(plane)
        expect {airport.depart(plane)}.to raise_error(RuntimeError, "The plane is already in the air!")
      end
    end

    context "calling depart when the weather is stormy" do
      it "will not allow for flights to take off during stormy conditions" do
        plane = Plane.new
        airport.weather.stormy = false
        airport.land(plane)
        airport.weather.stormy = true
        expect {airport.depart(plane)}.to raise_error
      end
    end
  end

  describe "#weather" do
    it { is_expected.to respond_to(:weather) }
  end

  describe "#capacity" do
    it { is_expected.to respond_to(:capacity) }

    context "setting default capacity that can be set by user" do
      it "allows the user to specify the airport capacity" do
        expect {Airport.new(50)}.not_to raise_error
      end
      it "will not allow more than the user specified capacity" do
        airport2 = Airport.new(50)
        airport2.weather.stormy = false
        50.times {airport2.land(Plane.new)}
        expect {airport2.land(Plane.new)}.to raise_error
      end
      it "expects to receive a default capacity when a number is not specified" do
        expect(Airport).to be_const_defined(:DEFAULT_CAPACITY)
      end
    end
  end
end
