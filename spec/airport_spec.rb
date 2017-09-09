require 'airport'

describe Airport do

  let(:plane) { double :plane, :name => 'BA125', :grounded => false, :is_a? => Plane }
  before :each { allow(plane).to receive(:report_grounded) }
  before :each { allow(plane).to receive(:report_airborne) }

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }

  describe '#initialize' do

    it 'initializes' do
      expect(subject).not_to be_nil
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'has a default capacity that can be overridden' do
      airport = Airport.new(50)
      expect(airport.capacity).to eq 50
    end
  end

  describe '#land' do

    before :each { allow(subject).to receive_messages(:stormy? => false, :full? => false) }

    it 'confirms land' do
      expect(subject.land(plane)).to eq "Tower - this is #{plane.name}. We have touchdown"
    end

    it 'does not land if stormy' do
      allow(subject).to receive(:stormy?) { true }
      expect { subject.land(plane) }.to raise_error 'Weather is stormy - arrival delayed'
    end

    it 'does not land if full' do
      allow(subject).to receive(:full?) { true }
      expect { subject.land(plane) }.to raise_error 'Flight -  we are at capacity. Maintain holding'
    end

    it 'fills a place on the runway' do
      subject.land(plane)
      expect(subject.runway[0]).to eq plane
    end

    it 'does not land if plane is grounded' do
      grounded_plane = double('grounded_plane', :name => 'BA125', :grounded => true, :is_a? => Plane)
      expect { subject.land(grounded_plane) }.to raise_error 'Aircraft is already on the ground'
    end

    it 'does not land a non-plane' do
      non_plane = double("A whale with a rocketpack")
      expect { subject.land(non_plane) }.to raise_error 'This is not a valid aircraft'
    end
  end

  describe '#take_off' do

    before :each { allow(subject).to receive_messages(:stormy? => false) }

    it 'confirms take off' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq "Tower - #{plane.name} is now airborne"
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

end
