require "Airport"

describe Airport do

  # subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  # it { is_expected.to respond_to(:land).with(1).argument }

  it "lands a plane" do
    expect(subject.land(plane)).to eq [plane]
  end

end
