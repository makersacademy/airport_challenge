require "airport.rb"

describe Airport do
  it "air traffic controller instructs planes to land" do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.return_planes).to eq [plane]
  end

  it "air traffic controller instructs planes to take off" do
    plane = Plane.new
    subject.land_plane(plane)
    subject.take_off(plane)
    expect(subject.return_planes).to eq []
  end

  it "raises an error when full" do
    subject.capacity.times do
      subject.land_plane(Plane.new)
    end
    expect { subject.land_plane(Plane.new) }.to raise_error "Landing Declined: Airport full"

  end

  it "has a variable default capacity" do
    expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
  end

end
