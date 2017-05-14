require 'airport'

RSpec.describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  describe "#capacity" do
    it "has a default hangar size of 10" do
      expect(airport.capacity).to eq Airport::DEFAULT_HANGAR_SIZE
    end

    it "allows for different hangar sizes" do
      airport = Airport.new(20)
      expect(airport.capacity).to eq 20
    end
  end

  describe "#planes" do
    it "return the planes currently landed at the airport" do
      allow(airport).to receive(:check_weather) { true }
      airport.authorize_landing(plane)
      expect(airport.planes).to eq [plane]
    end
  end

  describe "#authorize_landing" do
    it "makes a plane land at an airport" do
      allow(airport).to receive(:check_weather) { true }
      expect(airport.authorize_landing(plane)).to eq [plane]
    end

    it "doesn't let planes take off when weather is stormy" do
      allow(airport).to receive(:check_weather) { false }
      expect { airport.authorize_landing(plane) }.to raise_error "Airport temporarly closed due to bad weather"
    end

  end

  describe "#authorize_take_off" do
    it "the plane can take off from the airport" do
      allow(airport).to receive(:check_weather) { true }
      airport.authorize_landing(plane)
      expect(airport.authorize_take_off(plane)).to eq plane
    end

    it "raises an error if there are no planes available for take off" do
      expect { airport.authorize_take_off(plane) }.to raise_error "No planes currently available"
    end

    it "doesn't let planes take off when weather is stormy" do
      allow(airport).to receive(:empty?) { false }
      allow(airport).to receive(:check_weather) { false }
      expect { airport.authorize_take_off(plane) }.to raise_error "Airport temporarly closed due to bad weather"
    end
  end

  describe "#check_weather" do
    it "check if the weather report is equal to clear" do
      allow(airport.weather).to receive(:clear?) { true }
      expect(airport.check_weather).to eq true
    end
  end

end
