require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  context 'if the weather is stormy' do
    before do
      allow(weather).to receive(:weather_forecast).and_return(false)
    end

    it 'storm blocks departure' do
      airport.land(plane)
      allow(weather).to receive(:weather_forecast).and_return(:stormy)
      message = 'departure prevented due to stormy weather'
      expect { airport.release_plane }.to raise_error message
    end
  end

  context 'if the weather is sunny' do
    describe '#land' do
      it 'expects .land(plane) to return plane' do
        expect(airport.land(plane)).to eq plane
      end

      it 'expects .plane to return landed plane ID' do
        airport.land(plane)
        expect(airport.plane).to eq plane
      end
    end

    # describe '#release_plane' do
    #   it 'expects .release_plane to return released plane ID' do
    #     airport.land(plane)
    #     expect { airport.release_plane }.to output("#{plane} departed").to_stdout
    #   end
    # end
  end
end
