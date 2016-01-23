require 'airport'

describe Airport do

  let(:plane) {double :plane}

  it "instructs a plane to land" do
    expect(plane).to receive(:land)
    subject.land_plane(plane)
  end

  it "confirms if a plane has landed" do
    expect(plane).to receive(:land)
    expect(subject.land_plane(plane)).to include plane
  end

end
