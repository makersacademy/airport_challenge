require 'airport'

describe Airport do
  it 'can create an instance of airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end

  it 'allows the plane to land' do
    plane = Plane.new
    expect(subject.land(plane)).to eq 'Plane has landed'
  end

  # describe '#take_off' do
  it 'allows the plane to take off' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq 'Plane has left airport'
  end

  it 'will accept a set capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'will override a default capacity' do
    airport = Airport.new(40)
    expect(airport.capacity).to eq 40
  end

  describe '#land' do
    it 'raises an error when full' do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'Airport full'
    end
  end

  describe '#full' do
    it 'raises an error when not full' do
      # plane = Plane.new
      expect(subject.capacity).to eq 20
    end
  end
end
