require 'airport'

describe Airport do

  it{is_expected.to respond_to(:land).with(1).argument}

  it 'can land a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq(plane)
  end

  it 'landing a plane sets its location to current airport' do
    plane = Plane.new
    subject.land(plane)
    expect(plane.location).to eq(subject)
  end

  it 'landing a plane should set landed? to true' do
    plane = Plane.new
    subject.land(plane)
    expect(plane.landed?).to eq(true)
  end

  it{is_expected.to respond_to(:take_off).with(1).argument}

  it 'taking off should set the plane\'s location to in_the_air' do
    plane = Plane.new
    subject.take_off(plane)
    expect(plane.location).to eq('in_the_air')
  end

  it 'taking off should set landed to false' do
    plane = Plane.new
    subject.take_off(plane)
    expect(plane.landed?).to eq(false)
  end

  it 'when landed is true the plane must be at an airport' do
    plane = Plane.new
    subject.land(plane)
    expect(plane.location).to be_a(Airport)
  end

  it 'when location is not an airport landed? should be false' do
    plane = Plane.new
    expect(plane.landed?).to eq(false)
  end
end
