require 'airport.rb'

describe Airport do

  context '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    
    it 'can plane land at airport' do
      plane = double(:plane)
      expect(subject.land(plane)).to eq subject.hangar
    end

    it 'raises an error if hangar is full' do
      subject.capacity.times { subject.land double :plane }
      expect { subject.land double(:plane) }.to raise_error("Airport is full")
    end

    it 'prevents landing during stormy weather' do
      plane = double(:plane)
      subject.storm
      expect { subject.land(plane) }.to raise_error("Cannot land during a storm")
    end
  end
  
  context '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    
    it 'stored plane can take off' do
      plane = double(:plane)
      subject.land(plane)
      expect(subject.take_off(plane)).to eq("#{plane} has taken off.")
    end

    it 'prevents takeoff if weather is stormy' do
      plane = double(:plane)
      subject.storm
      expect { subject.take_off(plane) }.to raise_error('Cannot takeoff in a storm')
    end
  end

  context '#full?' do
    it 'does exist' do
      expect(subject).to respond_to(:full?)
    end
  end

  context '#hangar' do
    it 'can be displayed' do
      plane = double(:plane)
      subject.land(plane)
      expect(subject.hangar).to eq([plane])
    end
  end

  context '#initialization' do
    it 'has default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'has changeable capacity' do
      gatwick = Airport.new(22)
      expect(gatwick.capacity).to eq(22)
    end
  end

end
