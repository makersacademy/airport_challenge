require "Airport"

describe Airport do
  it {is_expected.to respond_to :plane_landed }

  it "Allows Planes to land" do
    plane = Plane.new
    expect(subject.plane_landed(plane)).to eq plane
  end
end
