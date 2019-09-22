require 'airport'

describe Airport do

  it 'responds to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'returns the landed plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

end
