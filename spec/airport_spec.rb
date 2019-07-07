require "airport"

describe Airport do
  subject(:airport) { described_class.new(20, weather) }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  describe "#capacity" do
    context 'when a user attempts to land plane when airport full' do
      it "raises an error" do
        allow(weather).to receive(:stormy?) { false }
        20.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error "Cannot land: Airport full"
      end
    end
  end

  describe "#land_plane" do
    it "an instance of a plane lands" do
      allow(weather).to receive(:stormy?) { false }
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it "plane cannot land in stormy weather" do
      allow(weather).to receive(:stormy?) { true }
      expect { airport.land(plane) }.to raise_error "Cannot land plane: No landing during storm"
    end
  end

  describe "#take_off" do
    it "confirm plane has taken off" do
      allow(weather).to receive(:stormy?) { false }
      airport.land(plane)
      expect { airport.take_off }.to change { subject.planes.count }.by(-1)
    end

    it "plane cannot take off in stormy weather" do
      allow(weather).to receive(:stormy?) { true }
      expect { airport.take_off }.to raise_error "Cannot take off plane: No take off during storm"
    end
  end
end
