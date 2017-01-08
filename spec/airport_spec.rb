require 'airport'

describe Airport do
  subject(:airport) {Airport.new}

  describe "#land" do
    it { is_expected.to respond_to(:land)}
    it { is_expected.to respond_to(:land).with(1).argument }

    it "stores the planes that are currently at the airport" do
      plane = Plane.new
      airport.weather.stormy = false
      subject.land(plane)
      expect(subject.arrivals).to include(plane)
    end
  end

  describe "#depart" do
    it { is_expected.to respond_to(:depart)}
    it { is_expected.to respond_to(:depart).with(1).argument }

    it "removes the departed plane from the list of arrivals following departure" do
      plane = Plane.new
      airport.weather.stormy = false
      subject.land(plane)
      subject.depart(plane)
      expect(subject.arrivals).not_to include(plane)
    end

    it "should retain a list of the departed flights" do
      plane = Plane.new
      airport.weather.stormy = false
      subject.land(plane)
      subject.depart(plane)
      expect(airport.departures).to include(plane)
    end
  end

  describe "#weather" do
    it { is_expected.to respond_to(:weather) }
  end

  describe "#stormy conditions" do
    it "it will not allow for flights to land during stormy conditions" do
      plane = Plane.new
      airport.weather.stormy = true
      expect {airport.land(plane)}.to raise_error
    end
    it "will not allow for flights to take off during stormy conditions" do
      plane = Plane.new
      airport.weather.stormy = false
      airport.land(plane)
      airport.weather.stormy = true
      expect {airport.depart(plane)}.to raise_error
    end
  end

  describe "#capacity" do
    it { is_expected.to respond_to(:capacity) }

    it "allows for up to 20 planes to land at the airport when capacity is set to 20" do
      airport.weather.stormy = false
      19.times {airport.land(Plane.new)}
      expect {airport.land(Plane.new)}.not_to raise_error
    end
    it "will not allow more than 20 planes to land at the airport when capacity is set at 20" do
      airport.weather.stormy = false
      20.times {airport.land(Plane.new)}
      expect {airport.land(Plane.new)}.to raise_error
    end
  end

  describe "setting default capacity that can be set by user" do
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
