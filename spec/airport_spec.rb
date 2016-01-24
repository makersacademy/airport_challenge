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

  it "confirms if a plane has taken off" do
    expect(plane).to receive(:take_off)
    expect(subject.plane_takes_off(plane)).to_not include plane
  end

  it "has a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "checks that an airport capacity can be set" do
    expect(Airport.new(20).capacity).to eq 20
  end

end
