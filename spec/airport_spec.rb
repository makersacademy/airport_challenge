require 'airport'

describe Airport do

  it "instructs a plane to land" do
    plane = Plane.new
    expect(subject.instruct_to_land(plane)).to eq true
  end

  it "confirms when plane has landed" do
    expect(subject.landed?).to eq true
  end
end
