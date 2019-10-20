require 'airport'

describe Airport do

  describe '#weather' do
    context 'change take off and landing conditions depending on weather'
    it 'should not allow take off and landing in stormy weather' do
      allow(subject).to receive(:weather) { 2 }
    end

    it 'should allow take off and landing in sunny weather' do
      allow(subject).to receive(:weather) { 1 }
    end

    it 'should respond to a weather condition' do
      expect(subject.weather).to be_between(1, 2)
    end
  end

  describe '#take_off' do
    context 'planes should take off from the airport'
    it 'shows plane has left the airport in sunny weather' do
      subject.weather = 1
      plane = Plane.new
      subject.land plane
      expect(subject.take_off(plane)).to eq plane
    end

    it 'should raise an error if there are no planes to take off' do
      subject.weather = 1
      plane = Plane.new
      expect { subject.take_off(plane) }.to raise_error 'There are no planes in the airport'
    end

    it 'should raise an error if weather is stormy' do
      subject.weather = 2
      plane = Plane.new
      expect { subject.take_off(plane) }.to raise_error 'Cannot take off in stormy weather'
    end
  end

  describe '#land' do
    context 'planes should land at the airport'
    it "should let planes land in sunny weather" do
      subject.weather = 1
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

    it 'should raise error if airport is full' do
      subject.weather = 1
      subject.capacity.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error 'Airport is full'
    end

    it 'should raise error if plane already in the airport' do
      plane = Plane.new
      subject.weather = 1
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'That plane is already in the airport'
    end

    it 'should raise an error if the weather is stormy' do
      subject.weather = 2
      plane = Plane.new
      expect { subject.land(plane) }.to raise_error 'Cannot land in stormy weather'
    end
  end

  describe '#capacity' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end
end
