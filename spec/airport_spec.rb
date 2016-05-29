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
      it "instructs the plane to land" do
        expect(subject).to receive(:land_plane)
        subject.land_plane
      end

      it "raises an error if the airport is at capacity" do
        described_class::DEFAULT_CAPACITY.times do
          subject.land_plane(plane)
        end

        expect do
          subject.land_plane(plane)
        end.to raise_error(described_class::ERROR[:full])
      end

      describe "#docked?" do
        it "confirms the plane has landed" do
          subject.land_plane(plane)
          expect(subject.docked?(plane)).to be_truthy
        end
      end
    end

    describe "#take_off" do
      it "raises an error if the plane isn't at the airport" do
        expect do
          subject.take_off(plane)
        end.to raise_error(described_class::ERROR[:no_plane])
      end

      it "instructs a plane to take off" do
        expect(subject).to receive(:take_off)
        subject.take_off(plane)
      end

      describe "#docked?" do
        it "confirms the plane is not docked at the airport" do
          expect(subject.docked?(plane)).to be_falsey
        end
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
        end.to raise_error described_class::ERROR[:stormy]
      end
    end

    describe "#take_off" do
      it "does not allow a plane to take off" do
        expect do
          subject.take_off(plane)
        end.to raise_error described_class::ERROR[:stormy]
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
