require 'airport'

describe Airport do
  it "instructs a plane to land" do
    plane = Plane.new
    expect(subject.instruct_to_land(plane)).to eq true
  end

  it "confirms the plane has landed" do
    plane = Plane.new
    subject.instruct_to_land(plane)
    expect(subject.confirm_landed).to eq "#{plane} has landed"
  end
end
