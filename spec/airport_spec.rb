require "airport"

describe Airport do
  it { is_expected.to respond_to(:confirm_plane_absence).with(1).arguments }
  it "is expected to respond with false when confirm_plane_absence is called with a plane that is at the airport" do
    plane = Plane.new(subject)
    expect(subject.confirm_plane_absence(plane)).to eq false
  end
  it "is expected to respond with true when confirm_plane_absence is called with a plane that is not at the airport" do
    plane = Plane.new(Airport.new)
    expect(subject.confirm_plane_absence(plane)).to eq true
  end
end
