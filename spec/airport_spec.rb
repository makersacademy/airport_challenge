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
    expect(subject.planes.length).to eq plane_count - 1
  end

  it 'removes specific plane after taking off' do
    plane = Plane.new
    subject.land_plane plane
    subject.takeoff
    expect(subject.planes.include?(plane)).to eq false
  end

  it 'cannot takeoff planes when stormy' do

  end

  it 'has default capacity of 50' do
    default_airport = Airport.new
    expect(default_airport.capacity).to eq 50
  end

  it 'can set capacity' do
    custom_airport = Airport.new(100)
    expect(custom_airport.capacity).to eq 100
  end

  it 'cannot land plane if capacity is full' do
    full_airport = Airport.new
    full_airport.capacity.times {full_airport.land_plane(Plane.new)}
    expect { full_airport.land_plane(Plane.new) } .to raise_error 'Airport at capacity'
  end


end