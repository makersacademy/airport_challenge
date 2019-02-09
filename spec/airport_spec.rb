require 'airport'

describe Airport do
  it 'is created and stores planes' do
    Airport.new
  end

  it 'responds to land command to let a plane land' do
  expect(subject).to respond_to :land
  end

  it 'lets a plane land and returns that plane' do
    p = Plane.new
    a = Airport.new
    a.land(p)
    expect(subject.land(p)).to eq p
  end

end
