require 'airport'

describe Airport do
  subject(:airport) {Airport.new}

  describe "#land" do
    it { is_expected.to respond_to(:arrive)}
    it { is_expected.to respond_to(:arrive).with(1).argument }

    it "stores the planes that are currently at the airport" do
      plane = Plane.new
      subject.arrive(plane)
      expect(subject.arrivals).to include(plane)
    end
  end

  describe "#depart" do
    it { is_expected.to respond_to(:depart)}
    it { is_expected.to respond_to(:depart).with(1).argument }

    it "removes the departed plane from the list of arrivals following departure" do
      plane = Plane.new
      subject.arrive(plane)
      subject.runway_open = true
      subject.depart(plane)
      expect(subject.arrivals).not_to include(plane)
    end

    it "should retain a list of the departed flights" do
      plane = Plane.new
      subject.arrive(plane)
      subject.runway_open = true
      subject.depart(plane)
      expect(subject.departures).to include(plane)
    end
  end

  describe "#check_weather" do
    it { is_expected.to respond_to(:check_weather) }
  end

  describe "#runway_open?" do
    it { is_expected.to respond_to(:runway_open?) }
    it { is_expected.to respond_to(:runway_open?).with(1).argument }
    context "if weather is 'Sunny'" do
      it "runway_open? returns true" do
        weather = Weather.new
        weather.current_weather = "Sunny"
        expect(subject.runway_open?(weather)).to eq true
      end
    end

    context "if weather is Stormy" do
      it "runway_open? returns false" do
        weather = Weather.new
        weather.current_weather = "Stormy"
        expect(subject.runway_open?(weather)).to eq false
      end
    end
  end

  describe "Closing runways" do
    it "if weather is Stormy, planes cannot take off" do
      plane = Plane.new
      subject.runway_open = false
      expect { subject.depart(plane) }.to raise_error
    end
  end
end
