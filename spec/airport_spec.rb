require 'airport_challenge'

describe Airport do
  it 'lands a plane' do
    expect(subject.land(Plane.new)).to eq true
  end

  it 'allows a plane to take off' do
    expect(subject.take_off(Plane.new)).to eq true
  end
end
