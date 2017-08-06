require_relative '../lib/airport'

describe Airport do
  it 'can land planes' do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq plane
  end

  it 'can make planes takeoff' do
    expect(subject).to respond_to(:takeoff)
  end

  it 'removes plane from airport after taking off' do
    subject.land_plane(Plane.new)
    plane_count = subject.planes.length
    subject.takeoff
    expect(subject.planes.length).to eq (plane_count - 1)
  end

  it 'removes specific plane after taking off' do
    plane = Plane.new
    subject.land_plane (plane)
    subject.takeoff
    expect(subject.planes.include?(plane)).to eq false
  end
end