require 'airport'

describe Airport do

  it 'responds to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'take-off' do
    plane = Plane.new
    expect(subject.take_off.class).to eq plane.class
  end

end
