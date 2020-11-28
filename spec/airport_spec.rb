require 'airport'

describe Airport do
  it 'can create an instance of airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end

  it 'will accept a set capacity' do
    expect(subject.capacity).to eq AIRPORT::DEFAULT_CAPACITY
  end

  describe '#land_plane' do
  it 'raises an error when full' do
    subject.capacity.times { subject.land_plane(Plane.new) }
    expect { subject.land_plane(Plane.new) }.to raise_error 'Airport full'
  end
end


  # it 'can respond to land_plane' do
  #   airport = Airport.new
  #   expect(subject).to respond_to('land_plane')
  # end

  # it 'adds 1 to total number of planes in airport when a plane lands' do
  #   airport = Airport.new
  #
  # end

  # it 'allows the plane to land' do
  #   plane = Plane.new
  #   expect(subject.land_plane(plane)).to eq plane
  # end
  #
  # it 'allows the plane to take off' do
  #   plane = Plane.new
  #   expect(subject.take_off_plane(plane)).to eq plane
  # end

   # it 'registers that a plane has taken off' do
   #   plane = Plane.new
   #
   #   expect(subject.take_off_confirm(1)).to eq 0
   #  end

  # it 'will see if a plane has taken off'
  #   expect(subject).to_respond_to()

end
