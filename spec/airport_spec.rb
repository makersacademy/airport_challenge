require 'airport'

describe Airport do
  it "lands a plane" do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.planes).to eq([plane])
  end

  it "takes off a plane" do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.takeoff_plane).to eq(plane)
  end

  it "has a max capacity" do
    expect(subject.capacity).to eq(Airport::MAX_CAPACITY)
  end

  describe "#landing a plane" do
    it "raises an error when the airport is full" do
      subject.capacity.times { subject.land_plane(Plane.new) }
      expect { subject.land_plane Plane.new }.to raise_error("Airport full")
    end
  end

  # describe "#stormy weather" do
  #   it "raises an error when landing in a stormy weather" do
      
  #   end
  # end

  describe "initialization" do
    subject { Airport.new }
    it "have initialized max capacity" do
      Airport::MAX_CAPACITY.times do
        subject.land_plane(Plane.new)
      end
      expect{ subject.land_plane(Plane.new)}.to raise_error "Airport full"
    end
  end
end