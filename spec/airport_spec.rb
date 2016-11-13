require 'airport'
require 'plane'
require 'weather'

describe Airport do

  let(:plane) { double :plane }

  it {is_expected.to respond_to :land}

  it 'allows a plane to land' do
    plane = Plane.new
    expect(subject.land(plane)).to include(plane)
  end

  it 'allows you to see landed planes, to confirm that they have landed' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it 'changes the state of landed planes to "landed"' do
    plane = Plane.new
    subject.land(plane)
    expect(plane.status).to eq 'landed'
  end

  it 'allows planes to take off' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it 'cannot instruct plane to take off from an airport where it is not present' do
    expect{subject.take_off(plane)}.to raise_error(RuntimeError, 'Plane not available for take off')
  end

  it 'cannot allow a plane to land at an airport where it is already present' do
    plane = Plane.new
    subject.land(plane)
    expect{subject.land(plane)}.to raise_error(RuntimeError, 'This plane has already landed')
  end

  it 'will not land a plane whose status is already "landed"' do
    plane = Plane.new
    plane.status = 'landed'
    expect{subject.land(plane)}.to raise_error(RuntimeError, 'This plane has already landed')
  end

  it 'changes the plane status back to "flying" upon take off' do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(plane.status).to eq 'flying'
  end

  it 'does not allow planes to land when airport capacity is full' do
    Airport::DEFAULT_CAPACITY.times {subject.land(Plane.new)}
    expect{subject.land(Plane.new)}.to raise_error(RuntimeError, 'Airport is full')
  end

  it 'has weather conditions' do
    expect(subject.weather).to eq subject.weather
  end

  it 'does not allow planes to land when weather is stormy' do
    plane = Plane.new
    allow(subject.weather).to receive(:current_weather).and_return('stormy')
    expect{subject.land(plane)}.to raise_error(RuntimeError, 'weather is too stormy')
  end

  it 'does not allow planes to take off when weather is stormy' do
    plane = Plane.new
    allow(subject.weather).to receive(:current_weather).and_return('stormy')
    expect{subject.take_off(plane)}.to raise_error(RuntimeError, 'weather is too stormy')
  end

  it 'checks that DEFAULT_CAPACITY has been set and is an integer' do
    expect(Airport::DEFAULT_CAPACITY).to be_kind_of(Integer)
  end

  it 'allows the system designer to override default capacity' do
    airport = Airport.new(30)
    expect(airport.capacity).to eq 30
  end


end
