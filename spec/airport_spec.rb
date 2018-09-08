require 'airport'

describe Airport do

  it "can store planes in a hanger" do
    plane = Plane.new
    expect(subject.put_plane_in_hanger(plane)).to eq([plane])
  end

  it "has a default hanger size" do
    20.times do
      subject.put_plane_in_hanger(Plane.new)
    end
    expect(Plane.new.land_at(subject)).to eq("Sorry, the hanger is full")
  end

  it "the DEFAULT_HANGER_SIZE can be overidden" do
    airport = Airport.new(1)
    airport.put_plane_in_hanger(Plane.new)
    expect(Plane.new.land_at(airport)).to eq("Sorry, the hanger is full")
  end

  it "planes can be removed from the hanger" do
    plane = Plane.new
    subject.put_plane_in_hanger(plane)
    expect(subject.remove_plane_from_hanger(plane)).to eq(plane)
  end
end
