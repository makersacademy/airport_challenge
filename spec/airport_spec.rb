require 'airport'

describe Airport do

  subject(:airport) { Airport.new(weather) }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  before do
    allow(plane).to receive(:land)
    allow(plane).to receive(:takeoff)
    allow(plane).to receive(:grounded?) { false }
    allow(weather).to receive(:stormy?) { false }
  end

  describe "#land(plane)" do

    it "raises an error if the weather is stormy" do
      allow(weather).to receive(:stormy?) { true }
      message = "Adverse weather conditions"
      expect { subject.land(plane) }.to raise_error message
    end

    context "in good weather conditions" do
      it "has the plane after landing" do
        subject.land(plane)
        expect(subject.planes_held).to include plane
      end

      it "raises an error if the plane is already at the aiport" do
        subject.land(plane)
        message = "Plane has already landed"
        expect { subject.land(plane) }.to raise_error message
      end

      it "raises an error if the airport is at full capacity" do
        allow(subject).to receive(:full?) { true }
        message = "Airport capacity has been reached"
        expect { subject.land(plane) }.to raise_error message
      end
    end
  end

  describe "#takeoff(plane)" do
    before do
      subject.land(plane)
    end

    it "raises an error when the weather is stormy" do
      allow(weather).to receive(:stormy?) { true }
      message = "Adverse weather conditions"
      expect { subject.takeoff(plane) }.to raise_error message
    end

    context "in good weather conditions" do
      it "removes plane from the airport" do
        subject.takeoff(plane)
        expect(subject.planes_held).not_to include plane
      end

      it "raises an error when plane is not held at the airport" do
        subject.takeoff(plane)
        message = "Plane is not at airport"
        expect { subject.takeoff(plane) }.to raise_error message
      end
    end
  end
end
