require 'airport'

describe Airport do
  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to(:land).with(1).argument}

  it "land a plane in airport" do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end


end
