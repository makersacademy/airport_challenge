require 'airport'

describe Airport do

  it 'lands a plane' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it 'lands a plane and shows plane in airport' do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq plane
  end

  it 'plane takes off' do
    expect(subject).to respond_to (:takeoff)
  end

  it 'plane takes off and confirms no longer in airport' do
    allow(subject).to receive(:forecast) {false}
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.takeoff(plane)).to eq plane
  end

  it 'raises error if the weather is stormy' do
    allow(subject).to receive(:forecast).and_return('stormy')
    plane = Plane.new
    expect {subject.land_plane(plane)}.to raise_error 'weather is stormy'
  end

  it 'raises error for takeoff if the weather is stormy' do
    allow(subject).to receive(:forecast).and_return('stormy')
    plane = Plane.new
    expect {subject.takeoff(plane)}.to raise_error 'weather is stormy'
  end

  it 'raises error if plane is already at the airport' do
    allow(subject).to receive(:forecast) {false}
    plane = Plane.new
    subject.land_plane(plane)
    expect {subject.land_plane(plane)}.to raise_error 'plane already at airport'
  end

  it 'raises error if takeoff plane is not at airport' do
    allow(subject).to receive(:forecast) {false}
    plane = Plane.new
    expect {subject.takeoff(plane)}.to raise_error 'plane not at airport'
  end

  it 'plane cannot land if airport is full' do
    allow(subject).to receive(:forecast) {false}
    plane = Plane.new
    20.times {|x| subject.land_plane(x += 1)}
    expect {subject.land_plane(plane)}.to raise_error 'airport is full'
  end

  it 'has a default capacity' do
   expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
 end

  it 'has a variable capacity' do
    airport = Airport.new(50)
    expect(airport.capacity).to eq 50
  end
end
