require 'airport_challenge'

describe Airport do
  it 'lands a plane' do
    expect(subject.land(Plane.new)).to eq true
  end

  it 'allows a plane to take off' do
    expect(subject.take_off(Plane.new)).to eq true
  end

  it 'allows a plane to take off and confirms that it is no longer in the airport' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq true
    expect(subject.check(plane)).to eq false
  end

  it 'returns an error in take off when weather is stormy' do
    allow(subject).to receive(:weather) { "stormy" }
    expect{subject.take_off(Plane.new)}.to raise_error ("Cannot take off, weather is stormy.")
  end

  it 'returns an error in land when weather is stormy' do
    allow(subject).to receive(:weather) { "stormy" }
    expect{subject.land(Plane.new)}.to raise_error ("Cannot land, weather is stormy.")
  end
end
