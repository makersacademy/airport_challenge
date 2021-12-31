require 'airport'

describe Airport do
  let(:plane) { double("plane") }
  let(:good_weather) { double("weather_service", alert?: false)}
  let(:bad_weather) { double("weather_service", alert?: true)}
  let(:airport) { described_class.new(Airport::DEFAULT_CAPACITY, good_weather) }
  let(:stormy_airport) { described_class.new(Airport::DEFAULT_CAPACITY, bad_weather) }
  let(:airport_capacity13) { described_class.new(13, good_weather) }

  describe '#receive' do
    context 'when ariport has default capacity' do
      it 'accepts planes to capacity, then raises an error' do  
        Airport::DEFAULT_CAPACITY.times { airport.receive(plane) }
        expect { airport.receive(plane) }.to raise_error "Sorry, Hangar Full"
      end
    end

    context 'when ariport has a custom capacity' do
      it 'accepts planes to capacity, then raises an error' do  
        13.times { airport_capacity13.receive(plane) }
        expect { airport_capacity13.receive(plane) }.to raise_error "Sorry, Hangar Full"
      end
    end

    context 'if stormy' do
      it 'will not allow planes to land' do
        expect { stormy_airport.receive(plane) }.to raise_error "Sorry, Runways Closed, Storms Approaching"
      end
    end
  end

  describe '#release' do
    context 'if stormy' do
      it 'raises an error if a plane tries to takeoff' do
        expect { stormy_airport.release(plane) }.to raise_error "Sorry, Runways Closed, Storms Approaching"
      end
    end
  end
end
