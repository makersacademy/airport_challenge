require 'airport'

describe Airport do
  it "responds to plane_landing method" do
    expect(subject).to respond_to :plane_landing
  end

  it { is_expected.to respond_to(:plane_landing).with(1).argument}

  it "allows planes to take_off" do
    expect(subject).to respond_to :plane_takeoff
  end
end
