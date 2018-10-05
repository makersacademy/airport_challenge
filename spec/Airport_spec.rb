require './Airport.rb'

describe Airport do
  
  it 'exists' do
    expect(Airport.new).not_to eq nil
  end

  it 'has the ability to land a plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

  it 'allows a plane to take off, removes from airport' do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(@plane).to eq nil
  end

  it 'should prevent planes from taking off when weather is stormy' do
    allow_any_instance_of(Weather).to receive(:clear) { false }
    expect{ subject.take_off(Plane.new) }.to raise_error 'Plane cannot take-off in a storm.'
  end

  it 'should prevent planes from taking off when weather is stormy' do
    allow_any_instance_of(Weather).to receive(:clear) { false }
    expect{ subject.land(Plane.new) }.to raise_error 'Plane cannot land in a storm.'
  end
end
