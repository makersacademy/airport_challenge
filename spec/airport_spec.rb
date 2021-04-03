require 'airport'

describe Airport do
  
  it 'airport responds to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'airport responds to takeoff' do
    expect(subject).to respond_to(:takeoff).with(1).argument
  end

  it 'plane lands in airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'plane takesoff from airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq plane
  end

end
