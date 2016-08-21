require 'airport'

describe Airport do

  let(:plane) {double :plane}

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "instructs plane to land" do
    expect(subject.land(plane)).to eq [plane]

  end

  it "instructs plane to take off" do
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane

  end

end
