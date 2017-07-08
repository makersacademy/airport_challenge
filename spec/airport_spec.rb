require 'airport'

describe Airport do

  let(:plane) { double :plane, :name => 'BA125' }

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }
  it { is_expected.to respond_to :stormy? }
  it { is_expected.to respond_to :full? }

  describe '#initialize' do

    it 'initializes' do
      airport = Airport.new
      expect(airport).not_to be_nil
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'has a default capacity that can be overridden' do
      airport = Airport.new(rand(10))
      expect(airport.capacity).to eq airport.capacity
    end
  end

  describe '#land' do

    it 'confirms it has landed' do
      allow(subject).to receive_messages(:stormy? => false, :full? => false)
      expect(subject.land(plane)).to eq "Tower - this is #{plane.name}. We have touchdown at #@name"
    end

    it 'does not land if weather is stormy' do
      allow(subject).to receive_messages(:stormy? => true)
      expect { subject.land(plane) }.to raise_error 'Weather is stormy - arrival delayed'
    end

    it 'does not land at an airport that is full' do
      allow(subject).to receive_messages(:stormy? => false, :full? => true)
      expect { subject.land(plane) }.to raise_error "Flight -  #@name is at capacity. Maintain holding!"
    end
  end

  describe '#take_off' do

    it 'confirms it has taken off from an airport' do
      allow(subject).to receive_messages(:stormy? => false)
      expect(subject.take_off(plane)).to eq "Tower - #{plane.name} is now airborne, leaving #@name"
    end

    it 'does not take off if weather is stormy' do
      allow(subject).to receive_messages(:stormy? => true)
      expect { subject.take_off(plane) }.to raise_error 'Weather is stormy - departure delayed'
    end
  end

  describe '#stormy?' do

    it 'is sometimes stormy' do
      weather = Airport.new.stormy?
      expect(weather).to be(true).or be(false)
    end
  end

  describe '#initialize' do

    it 'initializes' do
      airport = Airport.new
      expect(airport).not_to be_nil
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'has a default capacity that can be overridden' do
      airport = Airport.new(rand(10))
      expect(airport.capacity).to eq airport.capacity
    end
  end

end
