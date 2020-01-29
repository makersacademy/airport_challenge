require "airport"
require "plane"

describe Airport do
  let(:airport) { Airport.new(20, weather_report) }
  let(:plane) { Plane.new }
  let(:weather_report) { Weather_Report.new }

  context "when not stormy" do
    before do
      allow(weather_report).to receive(:stormy?).and_return false
    end
    it "instructs a plane to land" do
      expect { airport.land(plane) }.not_to raise_error
    end

    it "instructs a plane to take off" do
      expect { airport.take_off(plane) }.not_to raise_error
    end

    context "when airport is full" do
      it "does not allow planes to land" do
        20.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error "cannot land when airport full"
      end
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
