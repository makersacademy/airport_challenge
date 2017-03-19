require 'airport'
require 'plane'
require 'weather'

describe Airport do
let(:plane) { double :plane }

before do
  allow(plane).to receive(:land)
end

  describe '#takeoff' do
    let(:stormy_weather) { double :stormy_weather }
      it 'raises an error on #takeoff if weather is stormy' do
        allow(stormy_weather).to receive(:report).and_return(true)
        storm = stormy_weather.report
        expect { subject.takeoff(plane, storm) }.to raise_error "Unable to takeoff. Weather is stormy."
      end
  end


  describe '#land' do
    let(:stormy_weather) { double :stormy_weather }
      it 'raises an error on #land if weather is stormy' do        plane = Plane.new
        allow(stormy_weather).to receive(:report).and_return(true)
        storm = stormy_weather.report
        expect { subject.land(plane, storm) }.to raise_error "Unable to land. Weather is stormy."
      end

      it 'raises an error on #land when airport is at capacity' do
        allow(stormy_weather).to receive(:report).and_return(false)
        storm = stormy_weather.report
        Airport::DEFAULT_CAPACITY.times { subject.land(plane, storm) }
        expect { subject.land(plane, storm) }.to raise_error 'Airport at capacity.'
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
