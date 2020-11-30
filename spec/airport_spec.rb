require 'airport'
require 'weather'

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

  describe '#stormy?' do
    it 'can return true or false, depending on weather' do
      expect(subject.stormy?).to be(true).or be(false)
    end
  end


  describe '#stormy_take_off' do
    it 'raises an error if the weather is stormy' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.stormy_take_off(plane) }.to raise_error 'Operation aborted: Weather is stormy'
    end
  end
#   it 'raises an error if the weather is stormy' do
#   plane = Plane.new("G-ZBKP")
#   destination = Airport.new("LIS")
#   allow(airport).to receive(:stormy?).and_return true
#   expect { airport.takeoff_plane(plane, destination) }.to raise_error 'Operation aborted: Weather is stormy'
# end

end
