require 'airport'

describe Airport do
  subject(:airport) { Airport.new(plane: plane, weather: weather) }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  before do
    allow(weather).to receive(:stormy?).and_return(false)
  end

  describe '#land' do

    it 'expects .plane to return landed plane ID' do
      airport.land(plane)
      expect(airport.plane).to eq plane
    end

    it 'blocks landing if hanger full' do
      airport = Airport.new(weather: weather, capacity: Airport::HANGER_CAPACITY)
      Airport::HANGER_CAPACITY.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error('Hanger full')
    end

    it 'storm blocks landing' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.land(plane) }.to raise_error 'Bad weather stopped landing'
    end
  end

  describe '#release_plane' do
    it 'storm blocks departure' do
      airport.land(plane)
      allow(weather).to receive(:stormy?).and_return(true)
      expect { airport.release_plane }.to raise_error 'bad weather stopped departure'
    end

    it 'expects .release_plane to output released plane ID' do
      airport.land(plane)
      expect { airport.release_plane }.to output("#{plane} departed").to_stdout
    end
  end
end
