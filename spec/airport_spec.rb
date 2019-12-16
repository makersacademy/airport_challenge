require "airport"

describe Airport do
  describe "#land_plane" do
    it "instructs the aircraft to land" do
      expect(subject).to receive(:land_plane)
      subject.land_plane
    end

    it "confirms the plane has landed" do
      subject.land_plane(@aircraft)
      expect(subject.docked?(@aircraft))
    end
  end

    it "raise error if airport at capacity" do
      Airport::DEFAULT_CAPACITY.times { subject.land_plane(@aircraft) }
      expect { subject.land_plane(@aircaft) }.to raise_error(Airport::ERROR[:full])
    end

describe '#fly_be_free' do
  it "instructs aircraft to take off" do
    expect(subject).to receive(:fly_be_free)
    subject.fly_be_free
  end
    it "raises an error if the aircraft not in hanger" do
      expect { subject.fly_be_free(@aircaft) }.to raise_error(Airport::ERROR[:empty])
    end
end

describe '#capacity' do
    it "has a DEFAULT_CAPACITY" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it "can take an argument to set capacity on init" do
      capacity = rand(100)
      subject { described_class.new(capacity) }
    end
    it "has a specified capacity" do
      expect(subject.capacity).to eq(@capacity)
    end
  end
end
