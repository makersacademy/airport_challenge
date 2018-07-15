require 'airport'

describe Airport do
  it { is_expected.to respond_to :planes }
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'allows planes to land' do
    plane = Plane.new
    expect(subject.land(plane))
  end
end
