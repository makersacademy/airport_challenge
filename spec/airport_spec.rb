require 'airport'

describe Airport do

  it {is_expected.to respond_to(:land).with(1).argument}

  it 'instructs a plane to land at an airport' do
    plane1 = Plane.new
    expect(subject.land(plane1)).to eq plane1
  end

  it 'confirms that the plane has landed' do
    plane1 = Plane.new
    subject.land(plane1)
    expect(subject.plane).to eq plane1
  end

end
