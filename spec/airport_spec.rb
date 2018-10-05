require 'airport_challenge'

describe Airport do
  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq true
  end

  it 'allows a plane to take off and then returns an empty array' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq true
    expect(subject.check).to eq []
  end
end
