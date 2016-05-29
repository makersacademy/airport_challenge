require "airport"

describe Airport do
  before do
    @plane = double(:plane)
    allow(@plane).to receive_messages([:land, :depart_plane])
  end

  describe "#land_plane" do
    it "instructs the plane to land" do
      expect(subject).to receive(:land_plane)
      subject.land_plane
    end

    it "confirms the plane has landed" do
      subject.land_plane(@plane)
      expect(subject.planes).to include(@plane)
    end

    it "raises an error if the airport is at capacity" do
      Airport::DEFAULT_CAPACITY.times { subject.land_plane(@plane) }
      expect { subject.land_plane(@plane) }.to raise_error(Airport::ERROR_FULL)
    end
  end

  describe "#take_off" do
    it "raises an error if the plane isn't at the airport" do
      expect { subject.take_off(@plane) }.to raise_error(Airport::ERROR_NO_PLANE)
    end

    it "instructs a plane to take off" do
      expect(subject).to receive(:take_off)
      subject.take_off(@plane)
    end

    it "confirms the plane is not at the airport anymore" do
      # Assuming planes need to have landed to exist at the airport.
      # This test depends on another method working, needs refactoring :/
      subject.land_plane(@plane)
      subject.take_off(@plane)
      expect(subject.planes).to_not include(@plane)
    end
  end

  describe "#capacity" do
    it "has a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    describe "can take an argument to set capacity on instantiation" do
      capacity = rand(100)
      subject { described_class.new(capacity) }

      it "has a specified capacity" do
        expect(subject.capacity).to eq(capacity)
      end
    end
  end
end
