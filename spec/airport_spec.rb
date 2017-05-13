require 'airport'
require 'plane'

describe Airport do
  let(:plane) { double(:plane) }
  let(:airport) { subject.new }

  describe '#lands_planes' do
    it { is_expected.to respond_to(:lands_plane).with(1).argument }
    it 'returns the value of the plane which has landed' do
      allow(subject).to receive(:safe?).and_return(true)
      expect(subject.lands_plane(plane)).to eq "#{plane} has landed"
    end
    it 'adds the plane to the plans array' do
      allow(subject).to receive(:safe?).and_return(true)
      subject.lands_plane(plane)
      expect(subject.planes).to eq [plane]
    end
    it 'only allows planes to land if there is space' do
      allow(subject).to receive(:safe?).and_return(true)
      Airport::DEFAULTCAPACITY.times { subject.lands_plane plane }
      expect { subject.lands_plane(plane) }.to raise_error(RuntimeError, 'There is no more space at the airport')
    end
    it 'only allows planes to land if it is not stormy' do
      allow(subject).to receive(:safe?).and_return(false)
      expect{ subject.lands_plane(plane) }.to raise_error(RuntimeError, 'It is too stormy for landing')
    end
  end

  describe '#takes_off' do
    it { is_expected.to respond_to(:takes_off) }
    it 'returns the value of the plane which has taken off' do
      allow(subject).to receive(:safe?).and_return(true)
      subject.lands_plane(plane)
      expect(subject.takes_off).to eq "#{plane} has taken off"
    end
    it 'removes the plane from the plans array' do
      allow(subject).to receive(:safe?).and_return(true)
      subject.lands_plane(plane)
      subject.takes_off
      expect(subject.planes).to eq []
    end
    it 'only allows planes to take off if there is a plane in the airport' do
      expect { subject.takes_off }.to raise_error(RuntimeError, 'There are no planes at the airport')
    end
    it 'does not allow planes to take off it is is stormy' do
      allow(subject).to receive(:safe?).and_return(true)
      subject.lands_plane(plane)
      allow(subject).to receive(:safe?).and_return(false)
      expect{ subject.takes_off }.to raise_error(RuntimeError, 'It is too stormy for take off')
    end
  end

  describe "#safe?" do
    it { is_expected.to respond_to(:safe?) }
    it 'returns false if the weather is bad' do
      allow(subject).to receive(:weather).and_return(1)
      expect(subject.safe?).to be(false)
    end
    it 'returns true if the weather is good' do
      allow(subject).to receive(:weather).and_return(7)
      expect(subject.safe?).to be(true)
    end
  end

  describe '#weather' do
    it 'returns a value which is an integer'do
     expect(subject.weather).to be_a_kind_of(Integer)
    end
  end

  describe '#capacity' do
    it { is_expected.to respond_to(:capacity) }
    it 'variable will equal the  default capacity if no capacity is given' do
      expect(subject.capacity).to eq Airport::DEFAULTCAPACITY
    end
    it 'will equal the capacity specified when creating the airport instance' do
      airport = Airport.new 50
      expect(airport.capacity).to eq 50
    end
  end

  describe '#planes' do
    it { is_expected.to respond_to(:planes) }
    it 'adds the plane to the plans array' do
      plane = double('plane')
      allow(subject).to receive(:safe?).and_return(true)
      subject.lands_plane(plane)
      expect(subject.planes).to eq [plane]
    end
  end
end
