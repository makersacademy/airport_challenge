require "airport"
require "plane"

describe Airport do
  it "allows a plane to land" do
    expect(subject).to respond_to(:land_plane)
  end

  it "allows a plane to take-off" do
    expect(subject.take_off).to eq "The plane has left"
  end

  it "prevents landing when the airport is full" do
    subject.land_plane(Plane.new)
    expect { subject.land_plane Plane.new }.to raise_error "There is already a plane landed"
  end

end
