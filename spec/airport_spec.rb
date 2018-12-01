require 'airport'

describe Airport do
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }

  it 'lands a plane' do
  plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end
end
