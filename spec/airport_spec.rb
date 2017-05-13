require 'airport'
require 'plane'

describe Airport do
  let(:plane) { double(:plane) }

  describe '#lands_planes' do
    it { is_expected.to respond_to(:lands_plane).with(1).argument }
    it 'returns the value of the plane which has landed' do
      plane = double('plane', :lands_plane => plane)
      expect(subject.lands_plane(plane)).to eq "#{plane} has landed"
    end
    it 'adds the plane to the plans array' do
      subject.lands_plane(plane)
      expect(subject.planes).to eq [plane]
    end
    it 'only allows planes to land if there is space' do
      Airport::DEFAULTCAPACITY.times { subject.lands_plane plane }
      expect { subject.lands_plane(plane) }.to raise_error(RuntimeError, 'There is no more space at the airport')
    end
  end

  describe '#takes_off' do
    it { is_expected.to respond_to(:takes_off) }
    it 'returns the value of the plane which has taken off' do
      subject.lands_plane(plane)
      allow(subject).to receive(:weather).and_return(7)
      expect(subject.takes_off).to eq "#{plane} has taken off"
    end
    it 'removes the plane from the plans array' do
      subject.lands_plane(plane)
      allow(subject).to receive(:weather).and_return(7)
      subject.takes_off
      expect(subject.planes).to eq []
    end
    it 'only allows planes to take off if there is a plane in the airport' do
      expect { subject.takes_off }.to raise_error(RuntimeError, 'There are no planes at the airport')
    end
    it 'does not allow planes to take off it is is stormy' do
      subject.lands_plane(plane)
      allow(subject).to receive(:weather).and_return(1)
      expect{ subject.takes_off }.to raise_error(RuntimeError, 'It is too story for take off')
    end
  end

  describe "#safe?" do
    it { is_expected.to respond_to(:safe?) }
    it 'returns a boolean value' do
      expect(subject.safe?).to be(true).or be(false)
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
      subject.lands_plane(plane)
      expect(subject.planes).to eq [plane]
    end
  end
end
