require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  it { is_expected.to(respond_to(:land).with(1).argument) }
  it { is_expected.to(respond_to(:take_off).with(1).argument) }

  it "should allow planes to land" do
    plane.landed?
    expect { subject.land(plane) }.to change { subject.plane_count }.by(1)
  end

  it "should allow planes to take off" do
    subject.land(plane)
    expect { subject.take_off(plane) }.to change { subject.plane_count }.by(-1)
  end

end
