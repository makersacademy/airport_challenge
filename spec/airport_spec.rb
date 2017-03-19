require 'airport'
require 'plane'
require 'weather'

describe Airport do
let(:plane) { double :plane }
let(:stormy_weather) { double :stormy_weather }

before do
  allow(plane).to receive(:land)
  allow(plane).to receive(:landed?)
  allow(plane).to receive(:takeoff)
end


  describe '#takeoff' do
    it 'instructs planes to take off' do
      expect { subject.to receive :takeoff }
    end

    it 'no longer holds plane after take off' do
      allow(stormy_weather).to receive(:report).and_return(false)
      plane1 = Plane.new
      subject.land(plane1, stormy_weather)
      subject.takeoff(plane1, stormy_weather)
      expect(subject.planes).not_to include(plane1)
    end

    it 'raises an error if you try to get a plane to take off already departed from airport' do
      allow(stormy_weather).to receive(:report).and_return(false)
      plane1 = Plane.new
      subject.land(plane1, stormy_weather)
      subject.takeoff(plane1, stormy_weather)
      expect { subject.takeoff(plane1, stormy_weather) }.to raise_error "Plane has already taken off."
    end

    it 'raises an error on #takeoff if weather is stormy' do
      allow(stormy_weather).to receive(:report).and_return(true)
      storm = stormy_weather.report
      expect { subject.takeoff(plane, storm) }.to raise_error "Unable to takeoff. Weather is stormy."
    end
  end


  describe '#land' do
    it 'lands planes' do
      expect { subject.to receive :land }
    end

    it 'holds plane once landed' do
      subject.land(plane, stormy_weather)
      allow(stormy_weather).to receive(:report).and_return(false)
      expect(subject.planes).to include(plane)
    end

    it 'raises an error if you try to land a landed plane' do
      allow(stormy_weather).to receive(:report).and_return(false)
      plane1 = Plane.new
      subject.land(plane1, stormy_weather)
      expect { subject.land(plane1, stormy_weather) }.to raise_error "Plane has already landed."
    end

    it 'raises an error on #land if weather is stormy' do
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
