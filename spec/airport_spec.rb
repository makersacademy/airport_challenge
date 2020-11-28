require 'airport'

describe Airport do
  it 'can create an instance of airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end

  it 'allows the plane to land' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it 'allows the plane to take off' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq plane
  end

  # it 'will see if a plane has taken off'
  #   expect(subject).to_respond_to()

end
