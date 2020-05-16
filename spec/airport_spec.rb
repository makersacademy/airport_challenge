require 'airport'

describe Airport do
  it 'Should have an airport class' do
    expect(subject).to be_instance_of(Airport)
  end

  it 'Should have a defualt capacity' do
    expect(subject.capacity).to eq(10)
  end

  it 'Should be able to have a defualt capacity set' do
    expect(Airport.new(100).capacity).to eq(100)
  end

  describe '#land' do
    it 'Should respond to #land' do
      expect(subject).to respond_to(:land)
    end

    let(:plane) { Plane.new }
    it 'Should #land a plane in the airport' do
      expect(subject.land(plane)[0]).to eq(plane)
    end

    it 'should not let a plane land if airport is full' do
      10.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error('Airport full')
    end
  end

  describe '#take_off' do
    it 'Should respond to #take_off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'Should confirm that a plane as taken off' do
      expect { subject.take_off }.to output("Plane has taken off\n").to_stdout
    end
  end
end
