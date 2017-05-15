require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }
  let(:weather) { double(:weather) }

  describe '#lands_planes' do
    before do
      allow(plane).to receive(:flying).and_return(true)
      allow(plane).to receive(:arrives)
      allow(airport).to receive(:sunny?).and_return(true)
    end
    it 'returns the value of the plane which has landed' do
      expect(airport.lands_plane(plane)).to eq "#{plane} has landed"
    end
    context 'no space' do
      it 'prevents planes from landing' do
        Airport::DEFAULTCAPACITY.times { airport.lands_plane plane }
        message = 'There is no more space at the airport'
        expect { airport.lands_plane(plane) }.to raise_error(RuntimeError, message)
      end
    end
    context 'storm' do
      it 'prevents planes from landing' do
        allow(airport).to receive(:sunny?).and_return(false)
        message = 'It is too stormy for landing'
        expect { airport.lands_plane(plane) }.to raise_error(RuntimeError, message)
      end
    end
    context 'not flying' do
      it 'prevents planes from landing' do
        allow(plane).to receive(:flying).and_return(false)
        message = 'This plane has already landed'
        expect { airport.lands_plane(plane) }.to raise_error(RuntimeError, message)
      end
    end
  end

  describe '#takes_off' do
    before do
      allow(plane).to receive(:flying).and_return(true)
      allow(plane).to receive(:arrives)
      allow(airport).to receive(:sunny?).and_return(true)
      allow(plane).to receive(:departs)
    end
    it 'returns the value of the plane which has taken off' do
      airport.lands_plane(plane)
      expect(airport.takes_off).to eq "#{plane} has taken off"
    end
    context 'no plane at airport' do
      it 'prevents takeoff' do
        message = 'There are no planes at the airport'
        expect { airport.takes_off }.to raise_error(RuntimeError, message)
      end
    end
    context 'stormy' do
      it 'prevents takeoff' do
        airport.lands_plane(plane)
        allow(airport).to receive(:sunny?).and_return(false)
        message = 'It is too stormy for take off'
        expect { airport.takes_off }.to raise_error(RuntimeError, message)
      end
    end
  end
end
