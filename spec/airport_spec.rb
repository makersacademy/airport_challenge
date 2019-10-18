require "airport"

describe Airport do
  let(:subject) { Airport.new }
  let (:plane) { Plane.new }

  it "is an instance of a Airport" do
    expect(subject).to be_a(Airport)
  end

  it " has passengers" do
    expect(subject.passengers).to be_a(Array)
  end

  it "has a place for planes to land" do
    expect(subject.land_plane(plane)).to include(plane)
  end

  it "planes can depart from the airport" do
    subject.land_plane(plane)
    subject.plane_depart(plane)
    expect(subject.landed_planes.count).to eq(0)
  end
end
