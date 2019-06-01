require 'airport'

describe Airport do
  it 'has a default capacity of 10 planes' do
    expect(subject.capacity).to equal(10)
  end

  it 'allows the Airport capacity to be changed from the default' do
    subject.capacity = 20
    expect(subject.capacity).to equal(20)
  end

  it 'defaults the list of Planes to no planes at the airport' do
    expect(subject.planes).to be_empty
  end

  it 'allows a plane to be added to the list at the airport' do
    plane = Plane.new
    subject.add_plane(plane)
    expect(subject.planes).to include(plane)
  end

  it 'removes a plane from the list at the airport when requested' do
    plane = Plane.new
    subject.add_plane(plane)  
    subject.remove_plane(plane)
    expect(subject.planes).not_to include(plane)
  end

  it 'returns false when asked if a plane is at the airport which isnt there' do
    plane = Plane.new
    expect(subject.plane_at_airport?(plane)).to eql(false)
  end

  it 'returns true when asked if a plane is at the airport which is there' do
    plane = Plane.new
    subject.add_plane(plane)
    expect(subject.plane_at_airport?(plane)).to eql(true)
  end
end