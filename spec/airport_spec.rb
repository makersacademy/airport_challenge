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
      airport = described_class.new(20)
      expect(airport.capacity).to eq 20
    end
  end

  describe "#authorize_landing" do
    before do
      allow(plane).to receive(:landed) { false }
      allow(airport).to receive(:check_weather) { true }
    end

    it "makes a plane land at an airport" do
      expect(airport.authorize_landing(plane)).to eq [plane]
    end

    it "doesn't let planes land when weather is stormy" do
      allow(airport).to receive(:check_weather) { false }
      expect { airport.authorize_landing(plane) }.to raise_error "Airport temporarly closed due to bad weather"
    end

    it "raise error if planes try to land while airport full" do
      airport.capacity.times { airport.authorize_landing(plane) }
      expect { airport.authorize_landing(plane) }.to raise_error "Airport full! Landing not allowed!"
    end

    it "raise error if plane is already landed in a different airport" do
      allow(plane).to receive(:landed) { true }
      expect { airport.authorize_landing(plane) }.to raise_error "The plane is already in another airport"
    end
  end

  describe "#authorize_take_off" do
    before do
      allow(plane).to receive(:landed) { true }
      allow(airport).to receive(:check_weather) { true }
    end

    it "the plane can take off from the airport" do
      allow(plane).to receive(:landed) { false }
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

    it "raise error if plane is not in this airport" do
      allow(airport).to receive(:empty?) { false }
      expect { airport.authorize_take_off(plane) }.to raise_error "The plane is not in this airport"
    end
  end
end
