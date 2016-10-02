require "airport"

describe Airport do

  let(:plane) { double :plane }

  it "accepts planes landing" do
    expect(subject.land(plane)).to eq [plane]
  end

  it "won't allow landing plane if airport full" do
    subject.capacity.times{ subject.land(plane) }
    expect{ subject.land(plane) }.to raise_error "Airport is full. Unable to land."
  end

  it "accepts planes taking off" do
    expect(subject.takeoff(plane)).to eq plane
  end

end
