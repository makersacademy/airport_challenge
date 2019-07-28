require 'airplane'
require 'airport'

describe Airplane do
  it 'tells a plane to land at an airport' do
    expect(subject).to respond_to :land_plane
  end
  it 'tells a plane to take off and confirm it is no longer in the airport' do
    expect(subject).to respond_to :take_off
  end
  it 'plane can only land if it is flying' do
    subject.land_plane(Airport.new("Test Airport Name"))
    expect{subject.land_plane(Airport.new("Test Airport Name 2"))}.to raise_error ('Error - plane already grounded')
  end
  it 'plane can only take off if it is grounded' do
    # Assume starting status is "flying"
    expect{subject.take_off(Airport.new("Test Airport Name"))}.to raise_error ('Error - plane already in sky')
  end
  it 'plane can only take off from the airport it is in' do
    subject.land_plane(Airport.new("Test Airport Name"))
    expect{subject.take_off(Airport.new("Second Test Airport Name"))}.to raise_error ('Error - you are not in that airport')
  end
end
