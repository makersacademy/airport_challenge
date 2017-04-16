require 'airport'

describe Airport do

  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to :plane }

  it 'tells a plane to land' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
    expect(plane).to be_landed
  end

  it 'has the landed plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

end
