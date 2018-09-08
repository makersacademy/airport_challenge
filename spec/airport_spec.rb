require 'airport'

describe Airport do

  it "can store planes in a hanger" do
    plane = Plane.new
    expect(subject.hanger_plane(plane)).to eq([plane])
  end

  it "has a default hanger size" do
    20.times do
      subject.hanger_plane(Plane.new)
    end
    expect(Plane.new.land_at(subject)).to eq("Sorry, the hanger is full")
  end

  it "the DEFAULT_HANGER_SIZE can be overidden" do
    airport = Airport.new(1)
    airport.hanger_plane(Plane.new)
    expect(Plane.new.land_at(airport)).to eq("Sorry, the hanger is full")
  end

  it "planes can be removed from the hanger" do
    plane = Plane.new
    subject.hanger_plane(plane)
    expect(subject.unhanger_plane(plane)).to eq(plane)
  end
end
