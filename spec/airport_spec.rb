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
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.takeoff).to eq plane
  end

  it 'raises error if the weather is stormy' do
    plane = Plane.new
    expect {subject.land_plane(plane)}.to raise_error 'weather is stormy'
  end

  it 'raises error for takeoff if the weather is stormy' do
    expect {subject.takeoff}.to raise_error 'weather is stormy'
  end

  it 'plane cannot land if airport is full' do
    allow(subject).to receive(:forecast) {false}
    plane = Plane.new
    20.times {subject.land_plane(plane)}
    expect {subject.land_plane(plane)}.to raise_error 'airport is full'
  end

  it 'has a default capacity' do
   expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
 end

  # it 'has a variable capacity' do
  #   airport = Airport.new(50)
  #   50.times { airport.land_plane(Plane.new) }
  #   expect{ airport.land_plane(plane) }.to raise_error 'airport is full'
  # end
end
