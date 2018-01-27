require "Airport"

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  # it { is_expected.to respond_to(:land).with(1).argument }

  it "allows plane to land (add to array)" do
    expect(subject.land(plane)).to eq [plane]
  end

  # it { is_expected.to respond_to(:take_off) }

  it "allows plane to take off(remove from array)" do
    subject.land(plane)
    expect(subject.take_off(plane)). to be_instance_of(Plane)
  end

end
