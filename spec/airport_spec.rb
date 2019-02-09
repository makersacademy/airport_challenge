require 'airport'

describe Airport do
  it 'is created and stores planes' do
    Airport.new
  end

  it 'responds to land command to let a plane land' do
  expect(subject).to respond_to :land
  end

  it 'lets a plane land, adds that plane to the array and returns it' do
    a = Airport.new
    p = Plane.new
    a.land(p)
    expect(subject.land(p)).to eq subject.planes
  end

end
