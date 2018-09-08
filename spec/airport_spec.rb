require 'airport'

describe Airport do
  it "has a default hanger size" do
    20.times do
      subject.put_plane_in_hanger(Plane.new)
    end
    expect(Plane.new.land_at(subject)).to eq("Sorry, the hanger is full")
  end
end
