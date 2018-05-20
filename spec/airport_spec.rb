require 'airport'

describe Airport do
  it 'plane landing' do
    plane = Plane.new
    expect(subject.land(plane).last).to eq plane
  end

  it 'prevent landing when airport is full' do
    subject.capacity.times { subject.land Plane.new }
    expect { subject.land Plane.new }.to raise_error 'Airport full, no landing availability'
  end

  it 'has default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      airport = Airport.new(3)
      3.times { airport.land Plane.new }
      expect { airport.land Plane.new }.to raise_error 'Airport full, no landing availability'
    end
  end

  describe '#take_off' do
    it 'plane take off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end

    it 'print when plane takes off' do
      expect(subject.print_take_off).to eq 'A plane has taken off'
    end

    # it 'prevent take off when stormy' do
    #   plane = Plane.new
    #   subject.land(plane)
    #   weather = double(:weather, sunny?: false)
    #   weather.sunny?
    #   expect { subject.take_off }.to raise_error 'Stormy weather, no takes off'
    # end
  end
end
