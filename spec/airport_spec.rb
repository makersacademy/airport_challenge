require 'airport'
require 'plane'

describe Airport do
  let (:airport) {Airport.new}
  let (:plane) {Plane.new}

  context '#responds' do

    it 'responds to land' do
      expect(airport).to respond_to(:land)
    end

    it 'responds to take off' do
      expect(airport).to respond_to(:take_off)
    end

  end

  context '#non-stormy weather' do
    before { allow(airport).to receive(:weather) {false} }

    it 'take off removes the plane from the airport' do
      airport.land(plane)
      airport.take_off
      expect(airport.planes).to eql([])
    end

    it 'landing adds the plane to the airport' do
      airport.land(plane)
      expect(airport.planes).to eql([plane])
    end

    it 'cannot land if the airport is full' do
      Airport::DEFAULT_CAPACITY.times {airport.land(plane)}
      expect{airport.land(plane)}.to raise_error 'Airport is full'
    end

  end

  context '#stormy weather' do
    before { allow(airport).to receive(:weather) {true} }

    it 'cannot take off if weather is stormy' do
      expect{ airport.take_off }.to raise_error 'It is too stormy for take off'
    end

    it 'cannot land if weather is stormy' do
      expect{ airport.land(plane) }.to raise_error 'It is too stormy to land'
    end

  end

end
