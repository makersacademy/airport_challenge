require 'weather'

describe Weather do
  it 'responds to stormy?' do
    expect(subject).to respond_to :stormy?
  end

  context 'describing weather condition' do
    let(:plane) { double :plane }
    before {
      allow(plane).to receive(:flying?).and_return(true)
      allow(plane).to receive(:mark_as_landed)
    }


    context 'when stormy' do
      let(:weather) { return Weather.new(true) }
      let(:airport) { return Airport.new(2, 30, weather)}

      it 'prevent landing' do
        message = 'Unable to land due to stormy weather!'
        expect { airport.land_plane(plane) }.to raise_error message
      end
      it 'prevent take-off' do
        message = 'Unable to take_off due to stormy weather!'
        expect { airport.take_off_plane }.to raise_error message
      end
    end

    context 'when not stormy' do
      let(:weather) { return Weather.new(false) }
      let(:airport) { return Airport.new(2, 30, weather)}

      it 'allows landing' do
        airport.land_plane(plane)
        expect(airport.planes_garage.count).to eq(3)
      end
      it 'allowes take-off' do
        airport.take_off_plane
        expect(airport.planes_garage.count).to eq(1)
      end
    end
  end
end
