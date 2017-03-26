require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject(:airpport) { described_class.new }
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:stormy_weather) { double :stormy_weather }

  before do
    allow(plane).to receive(:land)
    allow(plane).to receive(:landed?)#.and_return(false)
    allow(plane).to receive(:takeoff)
  end

  describe '#takeoff' do
    context 'when not stormy' do
      before do
        allow(stormy_weather).to receive(:report).and_return(false)
      end

      it 'instructs planes to take off' do
        expect { airport.to receive :takeoff }
        # also expect { airport.to respond_to(:takeoff).with(2).argument }
      end
  # Plane.new to use double?
      it 'no longer holds plane after take off' do
        plane1 = Plane.new
        plane1 = Plane.new #plane
        airport.land(plane1, stormy_weather)
        airport.takeoff(plane1, stormy_weather)
        expect(airport.planes).not_to include(plane1)
      end

      it 'raises an error if you try to get a plane to take off already departed from airport' do
        plane1 = Plane.new
        airport.land(plane1, false)
        airport.takeoff(plane1, false)
        expect { airport.takeoff(plane1, false) }.to raise_error "Plane has already taken off."
      end
    end

  context 'when stormy' do
    it 'raises an error' do
      allow(stormy_weather).to receive(:report).and_return(true)
      storm = stormy_weather.report
      expect { airport.takeoff(plane, storm) }.to raise_error "Unable to takeoff. Weather is stormy."
    end
  end

  end


  describe '#land' do
    context 'when not stormy' do
      before do
        allow(stormy_weather).to receive(:report).and_return(false)
      end

      it 'instructs a plane to land' do
        expect { airport.to receive :land }
      end

      it 'holds plane once landed' do
        airport.land(plane, stormy_weather)
        expect(airport.planes).to include(plane)
      end

      it 'raises an error if you try to land a landed plane' do
        plane1 = Plane.new
        airport.land(plane1, stormy_weather)
        expect { airport.land(plane1, stormy_weather) }.to raise_error "Plane has already landed."
      end

      context 'when full' do
        it 'raises an error ' do
          allow(stormy_weather).to receive(:report).and_return(false)
          storm = stormy_weather.report
          Airport::DEFAULT_CAPACITY.times { airport.land(plane, storm) }
          expect { airport.land(plane, storm) }.to raise_error 'Airport at capacity.'
        end
      end

    end

    context 'when weather is stormy' do
      it 'raises an error' do
        allow(stormy_weather).to receive(:report).and_return(true)
        storm = stormy_weather.report
        expect { airport.land(plane, storm) }.to raise_error "Unable to land. Weather is stormy."
      end
    end


  end


  describe 'initialization' do
    it 'has a variable capacity' do
      airport = Airport.new(50)
      50.times { airport.land(plane, false) }
      expect{ airport.land(plane, false) }.to raise_error 'Airport at capacity.'
    end
  end

end
