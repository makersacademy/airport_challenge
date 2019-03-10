require "airport"

describe Airport do
  it { is_expected.to respond_to(:confirm_plane_absence).with(1).arguments }
  it { is_expected.to respond_to(:weather) }
  it { is_expected.to respond_to(:fleet) }
  it "is expected to respond with false when confirm_plane_absence is called with a plane that is at the airport" do
    plane = Plane.new(subject)
    expect(subject.confirm_plane_absence(plane)).to eq false
  end
  it "is expected to respond with true when confirm_plane_absence is called with a plane that is not at the airport" do
    plane = Plane.new(Airport.new)
    expect(subject.confirm_plane_absence(plane)).to eq true
  end
  it "is expected to have a value for @weather when an airport object is instantiated" do
    expect(subject.weather).to_not eq nil
  end
  it "is expected to have a value of either stormy or sunny for @weather when an airport object is instantiated" do
    expect(subject.weather).to eq("stormy").or(eq("sunny"))
  end
  it "is expected to set @fleet equal to an empty array when a plane object is instantiated" do
    expect(subject.fleet).to eq []
  end
  it "is expected to return true when full? method is called on airport that is at max capacity (@fleet.count >= CAPACITY)" do
    subject.fleet = Array(1..Airport::CAPACITY)
    expect(subject.full?).to eq true
  end
  it "is expected to return false when full? method is called on airport that is at under max capacity (@fleet.count < CAPACITY)" do
    subject.fleet = Array(2..Airport::CAPACITY)
    expect(subject.full?).to eq false
  end
end
