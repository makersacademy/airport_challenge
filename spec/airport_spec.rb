require 'airport'

describe Airport do

  it { is_expected.to respond_to(:capacity) }

  describe '#capacity' do
    it 'defaults to a capacity of DEFAULT_CAPACITY' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  it { is_expected.to respond_to(:land) }

  describe '#land' do

    it 'accepts 1 argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'accepts an instance of Plane as the argument' do
      plane = double(:plane)
      expect(subject.land(plane)).to include plane
    end

    it 'adds instance of Plane to list of planes at the airport' do
      plane = double(:plane)
      subject.land(plane)
      expect(subject.planes).to include plane
    end

    it 'raises an error if the weather is stormy' do
      plane = double(:plane)
      subject.find_weather(0)
      expect { subject.land(plane) }.to raise_error "Sorry, it is too stormy."
    end

    it 'raises an error if airport is full' do
      subject.capacity.times { subject.land(double(:plane)) }
      plane = double(:plane)
      expect { subject.land(plane) }.to raise_error "Sorry, airport is full."
    end

    it 'raises an error if the plane is already in the airport' do
      plane = double(:plane)
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "That plane is already at the airport."
    end

  end

  it { is_expected.to respond_to(:take_off) }

  describe '#take_off' do

    it 'accepts 1 argument' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'accepts an instance of Plane as the argument' do
      plane = double(:plane)
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'removes instance of Plane from list of planes at the airport' do
      plane = double(:plane)
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include plane
    end

    it 'raises an error if the weather is stormy' do
      plane = double(:plane)
      subject.land(plane)
      subject.find_weather(0)
      expect { subject.take_off(plane) }.to raise_error "Sorry, it is too stormy."
    end

    it 'raises an error if the plane is not in the airport' do
      plane = double(:plane)
      expect { subject.take_off(plane) }.to raise_error "That plane is not at the airport."
    end

  end

  it { is_expected.to respond_to(:weather) }

end
