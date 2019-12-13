require './lib/airport'
require './lib/weather'

describe Airport do

  let(:airport) { Airport.new }


  context 'Has a default capacity' do
    it 'chamnges the capcity to 20' do
    airport = Airport.new(100)
    expect(airport).to_not eq Airport::DEFAULT_CAPACITY
    end
  end

  context 'allows plane to land' do
    it 'returns true' do
      expect(subject).to respond_to(:land_plane)
    end

    context 'allows plane to take off' do
      it 'returns true' do
        expect(subject).to respond_to(:land_plane)
      end

      it 'but prevents landing in bad weather' do
        airport = Airport.new
        allow(airport).to receive(:good_weather?).and_return(false)
        plane = Plane.new
        expect{airport.land_plane(plane)}.to raise_error "Bad Weather, cannot LAND"
      end

      it 'removes the instance of plane from Airport' do
        airport = Airport.new
        allow(airport).to receive(:good_weather?).and_return(true)
        plane = Plane.new
        airport.land_plane(plane)
        airport.take_off(plane)
        expect(airport.hanger).not_to include(plane)
      end

      it 'rejects landing a plane if at capacity' do
        airport = Airport.new
        allow(airport).to receive(:good_weather?).and_return(true)
        10.times {airport.land_plane(Plane.new)}
        expect {airport.land_plane(Plane.new)}.to raise_error "Landing rejected, over capacity"
      end
    end
  end
end
