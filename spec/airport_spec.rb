require 'airport'

describe Airport do
  let(:plane) {double(:plane)}

  it "instructs a plane to land" do
    expect(subject.instruct_to_land(plane)).to eq plane
  end

  it "confirms when plane has landed" do
    expect(subject.landed?(plane)).to eq plane
  end
end
