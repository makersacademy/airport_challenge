require "airport"

describe Airport do
  let(:weather_good) { double(:weather, :stormy? => false) }
  let(:weather_bad) { double(:weather, :stormy? => true) }
  let(:plane) { double(:plane) }

  context "in good weather" do
    subject { described_class.new(described_class::DEFAULT_CAPACITY, weather_good) }

    describe "#land_plane" do
      it "instructs the plane to land" do
        expect(subject).to receive(:land_plane)
        subject.land_plane
      end

      it "confirms the plane has landed" do
        subject.land_plane(plane)
        expect(subject.docked?(plane)).to be_truthy
      end

      it "raises an error if the airport is at capacity" do
        described_class::DEFAULT_CAPACITY.times { subject.land_plane(plane) }
        expect { subject.land_plane(plane) }.to raise_error(described_class::ERROR_FULL)
      end
    end

    describe "#take_off" do
      it "raises an error if the plane isn't at the airport" do
        expect { subject.take_off(plane) }.to raise_error(described_class::ERROR_NO_PLANE)
      end

      it "instructs a plane to take off" do
        expect(subject).to receive(:take_off)
        subject.take_off(plane)
      end

      it "confirms the plane is not at the airport anymore" do
        # Assuming planes need to have landed to exist at the airport.
        # This test depends on another method working, needs refactoring :/
        subject.land_plane(plane)
        subject.take_off(plane)
        expect(subject.docked?(plane)).to be_falsey
      end
    end
  end

  context "in bad weather" do
    subject { described_class.new(described_class::DEFAULT_CAPACITY, weather_bad) }

    describe "#land_plane" do
      it "does not allow a plane to land" do
        expect { subject.land_plane(plane) }.to raise_error described_class::ERROR_STORMY
      end
    end

    describe "#take_off" do
      it "does not allow a plane to take off" do
        expect { subject.take_off(plane) }.to raise_error described_class::ERROR_STORMY
      end
    end
  end

  describe "#capacity" do
    it "has a default capacity" do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    describe "can take an argument to set capacity" do
      capacity = rand(100)
      subject { described_class.new(capacity) }

      it "has a specified capacity" do
        expect(subject.capacity).to eq(capacity)
      end
    end
  end
end
