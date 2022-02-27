require 'airport'

describe Airport do
  it 'responds to land with 1 argument passed' do
    expect(subject).to respond_to(:land).with(1).argument
  end
  
  it 'lands a plane' do
    plane = Plane.new
    # We want to return the plane we land
    expect(subject.land(plane)).to eq plane
  end
end
