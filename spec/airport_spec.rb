require 'airport'

describe Airport do
  let(:airport) { described_class.new }
  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }

  describe '#lands_planes' do
    before do
      allow(plane).to receive(:flying).and_return(true)
      allow(plane).to receive(:arrives)
      allow(airport).to receive(:safe?).and_return(true)
    end
    it { is_expected.to respond_to(:lands_plane).with(1).argument }
    it 'returns the value of the plane which has landed' do
      expect(airport.lands_plane(plane)).to eq "#{plane} has landed"
    end
    context 'no space' do
      it 'prevents planes from landing' do
        Airport::DEFAULTCAPACITY.times { airport.lands_plane plane }
        expect { airport.lands_plane(plane) }.to raise_error(RuntimeError, 'There is no more space at the airport')
      end
    end
    context 'storm' do
      it 'prevents planes from landing' do
        allow(airport).to receive(:safe?).and_return(false)
        expect { airport.lands_plane(plane) }.to raise_error(RuntimeError, 'It is too stormy for landing')
      end
    end
    context 'not flying' do
      it 'prevents planes from landing' do
        allow(plane).to receive(:flying).and_return(false)
        expect { airport.lands_plane(plane) }.to raise_error(RuntimeError, 'This plane has already landed')
      end
    end
  end

  describe '#takes_off' do
    before do
      allow(plane).to receive(:flying).and_return(true)
      allow(plane).to receive(:arrives)
      allow(airport).to receive(:safe?).and_return(true)
      allow(plane).to receive(:departs)
    end
    it 'returns the value of the plane which has taken off' do
      airport.lands_plane(plane)
      expect(airport.takes_off).to eq "#{plane} has taken off"
    end
    context 'no plane at airport' do
      it 'prevents takeoff' do
        expect { airport.takes_off }.to raise_error(RuntimeError, 'There are no planes at the airport')
      end
    end
    context 'stormy' do
      it 'prevents takeoff' do
        airport.lands_plane(plane)
        allow(airport).to receive(:safe?).and_return(false)
        expect { airport.takes_off }.to raise_error(RuntimeError, 'It is too stormy for take off')
      end
    end
  end

  describe '#capacity' do
    it 'variable will equal the  default capacity if no capacity is given' do
      expect(airport.capacity).to eq Airport::DEFAULTCAPACITY
    end
    it 'will equal the capacity specified when creating the airport instance' do
      airport = Airport.new 50
      expect(airport.capacity).to eq 50
    end
  end
end
