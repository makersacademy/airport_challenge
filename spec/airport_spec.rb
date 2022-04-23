require './lib/airport'

describe Airport do
    
  it 'responds to method land' do
    expect(subject).to respond_to :land
  end

  it 'method land accepts one argument' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

end