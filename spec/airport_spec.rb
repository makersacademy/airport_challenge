require 'airport'

describe Airport do
  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to(:land).with(1).argument }

  it 'tells a plane to land and confirms that it has landed'  do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
    expect(plane).to be_landed
  end

end
