require 'airport'

describe Airport do
  it 'responds to land_plane' do
    expect(subject).to respond_to :land_plane
  end
  it 'responds to take off' do
    expect(subject).to respond_to :take_off
  end
  it 'raises an error when full' do
    subject.capacity.times { subject.land_plane(Plane.new) }
    expect { subject.land_plane Plane.new }.to raise_error 'Airport is full'
  end 
  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
end

describe 'initialization' do
  it 'has a variable capacity' do
    airport = Airport.new(50)
    50.times { airport.land_plane Plane.new }
    expect { airport.land_plane Plane.new }.to raise_error 'Airport is full'
  end
end
