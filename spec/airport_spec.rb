require 'airport'

describe Airport do

  let(:plane) { double :plane, :name => 'BA125', :landed => false }
  before :each { allow(plane).to receive(:report_landed) }
  before :each { allow(plane).to receive(:report_airborne) }

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }
  it { is_expected.to respond_to :stormy? }
  it { is_expected.to respond_to :full? }

  describe '#initialize' do

    it 'initializes' do
      expect(subject).not_to be_nil
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'has a default capacity that can be overridden' do
      airport = Airport.new(5)
      expect(airport.capacity).to eq 5
    end
  end

  describe '#land' do

    before :each { allow(subject).to receive_messages(:stormy? => false, :full? => false) }

    it 'confirms land' do
      expect(subject.land(plane)).to eq "Tower - this is #{plane.name}. We have touchdown at #@name"
    end

    it 'does not land if stormy' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(plane) }.to raise_error 'Weather is stormy - arrival delayed'
    end

    it 'does not land if full' do
      allow(subject).to receive(:full?) { true }
      expect { subject.land(plane) }.to raise_error "Flight -  #@name is at capacity. Maintain holding!"
    end

    it 'can be filled by a landing plane' do

      subject.land(plane)
      expect(subject.runway.count).to eq 1
    end

    it 'does not land if plane is landed' do
      landed_plane = double('landed_plane', :landed => true)
      expect { subject.land(landed_plane) }.to raise_error 'Aircraft is already on the ground'
    end
  end

  describe '#take_off' do

    before :each { allow(subject).to receive_messages(:stormy? => false) }

    it 'confirms take off' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq "Tower - #{plane.name} is now airborne, leaving #@name"
    end

    it 'does not take off if stormy' do
      subject.land(plane)
      allow(subject).to receive(:stormy?) { true }
      expect { subject.take_off(plane) }.to raise_error 'Weather is stormy - departure delayed'
    end

    it 'does not take off if plane is not on runway' do
      expect { subject.take_off(plane) }.to raise_error "Aircraft is not present at this location"
    end

    it 'removes plane from runway' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.runway).to be_empty
    end
  end

  describe '#stormy?' do

    it 'is sometimes stormy' do
      weather = Airport.new.stormy?
      expect(weather).to be(true).or be(false)
    end
  end

end
