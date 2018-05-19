require 'airport'
require 'plane'

describe Airport do
  it 'can land an airplane' do
    expect(subject).to respond_to(:land)
  end

  it 'can move a landed plane to the hanger' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.hanger).to include(plane)
  end

  it 'allows an airplane to take off' do
    expect(subject).to respond_to(:takeoff)
  end

  it 'confirms that plane that took off is no longer in hanger' do
    subject.land(Plane.new)
    taken_off_plane = subject.takeoff
    expect(subject.hanger).to_not include (taken_off_plane)
  end

  it 'raises an error for landing when hanger is full' do
    Airport::DEFAULT_CAPACITY.times{ subject.land(Plane.new) }
    expect{ subject.land(Plane.new) }.to raise_error('Airport is full')
  end

  it 'raises an error if a plane wants to land when already at airport' do
    plane = Plane.new
    subject.land(plane)
    expect{ subject.land(plane) }.to raise_error('Plane already at airport')
  end

end
