require 'airport'

describe Airport do
  subject(:airport) {described_class.new}

  it "the plane lands in the airport" do
    plane = double("This Plane")
    expect(subject.land(plane)).to eq plane
  end

  it "confirms the plane has landed" do
    plane = subject.land(Plane.new)
    expect(subject.confirm_landing).to eq "The #{plane} has landed at #{subject}."
  end

end
