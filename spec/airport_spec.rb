require "airport"

describe Airport do

  let(:plane) { double :plane }

  it "accepts planes landing" do
    expect(subject.land(plane)).to eq plane
  end

  it "accepts planes taking off" do
    expect(subject.takeoff(plane)).to eq plane
  end

end
