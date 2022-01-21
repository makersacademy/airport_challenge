require 'airport'

describe Airport do
  it "lands a plane" do
    allow(subject).to receive(:stormy?).and_return(false)
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.planes).to eq([plane])
  end

  it "takes off a plane" do
    allow(subject).to receive(:stormy?).and_return(false)
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.takeoff_plane).to eq(plane)
  end

  it "has a max capacity using default number" do
    expect(subject.capacity).to eq(Airport::MAX_CAPACITY)
  end

  describe "#landing a plane" do
    it "raises an error when the airport is full" do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.capacity.times { subject.land_plane(Plane.new) }
      expect { subject.land_plane Plane.new }.to raise_error("Airport full")
    end
  end

  describe "#stormy weather" do
    it "raises an error when landing in a stormy weather" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.land_plane Plane.new }.to raise_error("Stormy weather")
    end
    it "raises an error when taking off in a stormy weather" do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.takeoff_plane}.to raise_error("Stormy weather")
    end
  end

  describe "#initialization" do
    subject { Airport.new(100) }
    it "have initialized max capacity using non-default number" do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.capacity.times do
        subject.land_plane(Plane.new)
      end
      expect{ subject.land_plane(Plane.new)}.to raise_error "Airport full"
    end
  end
  # describe "#randomness test = check if weather failure condition works" do
  #   subject { Airport.new(1000) }
  #   it "returns stormy weather if run enough times" do
  #     while expect{ subject.land_plane(Plane.new)}.to raise_error "Stormy weather" do
  #       subject.land_plane(Plane.new)
  #     end
  #   end
  # end
end