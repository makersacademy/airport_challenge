require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:plane) }

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'returns a landed plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end
end
