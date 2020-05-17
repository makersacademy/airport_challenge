require_relative '../lib/plane'

describe Plane do
  subject(:plane) { Plane.new }
  let(:a) { Airport.new }
  let(:expects_good_weather) { allow(a).to receive(:weather_is_bad?) { false } }

  describe '#land' do
    it 'allows an ATC to instruct a pane to land at an airport' do
      expects_good_weather
      plane.land(a)
      expect(a.planes.length).to eq(1)
    end
    it 'allows an ATC to prevent landing when airport is full' do
      expect { plane.land(Airport.new(0)) }
      .to raise_error('You cannot land - the airport is full.')
    end
    it 'allows an ATC to prevent landing when the weather is stormy' do
      allow(a).to receive(:weather_is_bad?) { true }
      expect(plane.land(a)).to eq('You cannot land - the weather is bad')
    end
  end

  describe '#take_off' do
    it 'plane confirms it is in the air' do
      expects_good_weather
      plane.land(a)
      expect(plane.take_off(a)).to eq('Liftoff! We have a liftoff!')
      expect(a.planes.length).to eq(0)
    end
    it 'allows an ATC to prevent take off when the weather is stormy' do
      expects_good_weather
      plane.land(a)
      allow(a).to receive(:weather_is_bad?) { true }
      expect(plane.take_off(a)).to eq('You cannot take off - the weather is bad')
    end
  end

  # Defending agaisnt edge cases
  it 'prevents an airborne plane from taking-off again' do
    expects_good_weather
    expect(plane.take_off(a)).to eq(nil)
  end

  it 'prevents a grounded plane from landing again' do
    expects_good_weather
    plane.land(a)
    expect(plane.land(a)).to eq(nil)
  end

  it 'prevents a plane taking off from an airport it is not at' do
    expects_good_weather
    b = Airport.new
    allow(b).to receive(:weather_is_bad?) { false }
    plane.land(a)
    expect(plane.take_off(b)).to eq(nil)
  end
end
