require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it 'lands the plane' do
    plane = @plane
    expect(subject.land(plane)).to eq plane
  end
end
