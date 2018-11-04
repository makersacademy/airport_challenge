require 'airport'

describe Airport do

  it 'sets a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'allows the setting of a capacity' do
    capacity = rand(1..35)
    expect(Airport.new(capacity).capacity).to eq capacity
  end

  describe '#land' do
    it 'stores landed planes at the airport' do
      n = rand(1..5)
      n.times { subject.land(Plane.new) }
      expect(subject.planes.length).to eq n
    end
    it 'changes the status of the landed plane' do
      plane = Plane.new
      subject.land(plane)
      expect(plane.status).to eq 'landed'
    end
    it 'will not allow planes to land when stormy' do
      plane = Plane.new
      expect { subject.land(plane) }.to raise_error 'Too stormy to try landing'
    end
    it 'will not allow planes to land when full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error 'This airport is full'
    end
  end

  describe '#take_off' do
    it 'will not allow planes to take off when stormy' do
      plane = Plane.new
      subject.land(plane)
      expect { subject.take_off(plane) }.to raise_error 'Too stormy to try take off'
    end
  end

end
