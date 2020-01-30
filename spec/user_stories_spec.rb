require "airport"
require "plane"

describe Airport do
  let(:airport) { Airport.new(weather_report, capacity = Airport::DEFAULT_CAPACITY) }
  let(:plane) { Plane.new }
  let(:weather_report) { Weather_Report.new }

  context "when not stormy" do
    before do
      allow(weather_report).to receive(:stormy?).and_return false
    end

    it "airports have default capacity" do
      default_airport = Airport.new(weather_report)
      Airport::DEFAULT_CAPACITY.times { default_airport.land(plane) }
      expect { default_airport.land(plane) }.to raise_error "cannot land when airport full"
    end

    it "instructs a plane to land" do
      expect { airport.land(plane) }.not_to raise_error
    end

    it "instructs a plane to take off" do
      airport.land(plane)
      expect { airport.take_off(plane) }.not_to raise_error
    end

    it "allows planes to take off only from the airport they are at" do
      allow(weather_report).to receive(:stormy?).and_return false
      airport2 = Airport.new(weather_report, 20)
      airport2.land(plane)
      expect { airport.take_off(plane) }.to raise_error "plane not at this airport"
    end

    context "when airport is full" do
      it "does not allow planes to land" do
        20.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error "cannot land when airport full"
      end
    end

    it "flying planes cannot take off" do
      airport.land(plane)
      flying_plane = airport.take_off(plane)
      expect { flying_plane.take_off }.to raise_error "plane already flying"
    end

    it "flying planes cannot be at an airport" do
      airport.land(plane)
      flying_plane = airport.take_off(plane)
      expect { flying_plane.airport }.to raise_error "plane already flying"
    end
  end

  context "when weather is stormy" do
    before do
      allow(weather_report).to receive(:stormy?).and_return true
    end
    it "does not allow planes to land" do
      expect { airport.land(plane) }.to raise_error "cannot land plane when stormy"
    end

    it "does not allow planes to take off" do
      expect { airport.take_off(plane) }.to raise_error "cannot take off when stormy"
    end
  end
end
