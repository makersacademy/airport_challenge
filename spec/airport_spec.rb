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

  it "prevents landing when airport is full" do
    plane = Plane.new
    plane1 = Plane.new
    subject.land_plane(plane)
    expect { subject.land_plane(plane1) }.to raise_error "Landing Declined: Airport full"
  end

  it "has a variable default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

end
