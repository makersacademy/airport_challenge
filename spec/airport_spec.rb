require 'airport_challenge'

describe Airport do
  it 'lands a plane when the weather is sunny' do
    plane = Plane.new
    allow(subject).to receive(:initialize) { "sunny" }
    expect(subject.hanger).to eq [plane]
  end

  it 'allows a plane to take off and then returns an empty array' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq true
    expect(subject.check).to eq []
  end

  it 'prevents a plane from taking off when the weather is stormy' do
    plane = Plane.new
    allow(subject).to receive(:initialize) { "stormy" }
    expect(subject.take_off(plane)).to eq false
  end
end
