require "airport"

describe Airport do
  let(:weather_good) { double(:weather, stormy?: false) }
  let(:weather_bad) { double(:weather, stormy?: true) }
  let(:plane) { double(:plane) }

  context "in good weather" do
    subject do
      described_class.new(described_class::DEFAULT_CAPACITY, weather_good)
    end

    describe "#land_plane" do
      it "instructs a plane to land" do
        expect(subject).to receive(:land_plane)
        subject.land_plane
      end

      it "does not allow landing if plane has already landed" do
        subject.land_plane(plane)

        expect do
          subject.land_plane(plane)
        end.to raise_error(described_class::ERROR[:plane_docked])
      end

      it "does not allow landing if the airport is at capacity" do
        described_class::DEFAULT_CAPACITY.times do
          plane_unique = double(:plane)
          subject.land_plane(plane_unique)
        end

        expect do
          subject.land_plane(plane)
        end.to raise_error(described_class::ERROR[:full])
      end
    end

    describe "#take_off" do
      it "instructs a plane to take off" do
        expect(subject).to receive(:take_off)
        subject.take_off(plane)
      end

      it "does not allow take-off if plane isn't there" do
        expect do
          subject.take_off(plane)
        end.to raise_error(described_class::ERROR[:plane_missing])
      end
    end
  end

  context "in bad weather" do
    subject do
      described_class.new(described_class::DEFAULT_CAPACITY, weather_bad)
    end

    describe "#land_plane" do
      it "does not allow a plane to land" do
        expect do
          subject.land_plane(plane)
        end.to raise_error(described_class::ERROR[:stormy])
      end
    end

    describe "#take_off" do
      it "does not allow a plane to take off" do
        expect do
          subject.take_off(plane)
        end.to raise_error(described_class::ERROR[:stormy])
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
