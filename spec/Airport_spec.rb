require './Airport.rb'

describe Airport do
  
  it 'exists' do
    expect(Airport.new).not_to eq nil
  end

  it 'has the ability to land a plane' do
    allow_any_instance_of(Weather).to receive(:clear) { true }
    subject.capacity(1)
    plane = Plane.new
    expect(subject.land(plane)).to match_array(plane)
  end

  it 'allows a plane to take off, removes from airport' do
    allow_any_instance_of(Weather).to receive(:clear) { true }
    subject.capacity(1)
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).not_to match_array(plane)
  end

  it 'should prevent planes from taking off when weather is stormy' do
    allow_any_instance_of(Weather).to receive(:clear) { false }
    subject.capacity(1)
    expect{ subject.take_off(Plane.new) }.to raise_error 'Plane cannot take-off in a storm.'
  end

  it 'should prevent planes from taking off when weather is stormy' do
    allow_any_instance_of(Weather).to receive(:clear) { false }
    subject.capacity(1)
    expect{ subject.land(Plane.new) }.to raise_error 'Plane cannot land in a storm.'
  end

  it 'should prevent planes from landing if airport is full' do
    allow_any_instance_of(Weather).to receive(:clear) { true }
    subject.capacity(1)
    subject.land(Plane.new)
    expect{ subject.land(Plane.new) }.to raise_error 'Plane cannot land, airport is full.'
  end

  it 'should allow airport capacity to be changed' do
    allow_any_instance_of(Weather).to receive(:clear) { true }
    subject.capacity(2)
    plane_1 = Plane.new
    subject.land(plane_1)
    plane_2 = Plane.new
    expect(subject.take_off(plane_1)).not_to match_array(plane_2)
  end
end
