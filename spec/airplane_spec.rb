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
  # it 'confirms that plane that took off is no longer in hanger' do
  #   subject.land(Plane.new)
  #   taken_off_plane = subject.takeoff
  #   expect(@hanger).to_not include (taken_off_plane)
  # end
end
