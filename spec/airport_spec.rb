require './lib/airport'

describe Airport do

  it { is_expected.to respond_to :land }

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it { is_expected.to respond_to :take_off }

  it 'plane takes off' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq plane
  end
end
