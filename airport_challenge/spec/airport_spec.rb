require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
end
  it { is_expected.to respond_to(:plane) }
end
  it 'lands plane' do
  plane = Plane.new
  subject.land(plane)
  expect(subject.dock(plane)).to eq plane
  end
end
