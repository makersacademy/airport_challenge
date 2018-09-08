require 'airport'

describe Airport do
  it "has a default hanger size" do
    20.times do
      subject.put_plane_in_hanger(Plane.new)
    end
    expect(Plane.new.land_at(subject)).to eq("Sorry, the hanger is full")
  end

  it "'s DEFAULT_HANGER_SIZE can be overidden" do
    airport = Airport.new(1)
    airport.put_plane_in_hanger(Plane.new)
    expect(Plane.new.land_at(airport)).to eq("Sorry, the hanger is full")
  end
end
