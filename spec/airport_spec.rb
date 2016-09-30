require "airport"

describe Airport do

  let(:grounded_plane) { double :plane, flying?: false }
  let(:flying_plane) { double :plane, flying?: true }

  it "allows a plane to land" do
      expect(subject.land(flying_plane)).to eq [flying_plane]
  end

  it "won't allow a plane to land if the airport is full" do
      subject.capacity.times { subject.land(flying_plane) }
      expect{ subject.land(flying_plane) }.to raise_error "Cannot land. Airport is full."
  end

  it "won't allow a plane to land if it's not flying" do
      expect{ subject.land(grounded_plane) }.to raise_error "Cannot land. Plane isn't flying."
  end

  it "allows a plane to takeoff" do
      expect(subject.takeoff(grounded_plane)).to eq grounded_plane
  end

  it "won't allow a plane to takeoff if it's flying" do
      expect{ subject.takeoff(flying_plane) }.to raise_error "Cannot take off. Plane is flying."
  end

  it "has a default capacity" do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
  end

  it "allows you to change the capacity" do
      subject.capacity = 15
      expect(subject.capacity).to eq 15
  end

end
