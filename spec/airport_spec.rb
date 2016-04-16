require 'airport'

describe Airport do
  let(:plane) { double(:plane, :landed => true, :take_off => true) }

  describe '#land' do
    it 'accepts a plane to land' do
      subject.land(plane)
      expect{ subject.land(plane) }.to raise_error 'Airport full'
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off' do
      subject.land(plane)
      subject.take_off(plane)
      expect{ subject.take_off(plane) }.to raise_error 'All planes have taken off'
    end
  end

  describe '#change_weather' do
    it 'prevents a plane taking off in stormy weather' do
      airport = Airport.new
      allow(airport).to receive(:rand) { 10 }
      airport.land(plane)
      airport.change_weather
      expect{ airport.take_off(plane) }.to raise_error 'Plane cannot take off in stormy weather'
    end

    it 'prevents a plane landing in stormy weather' do
      airport = Airport.new
      allow(airport).to receive(:rand) { 10 }
      airport.change_weather
      expect{ airport.land(plane) }.to raise_error 'Plane cannot land in stormy weather'
    end
  end

end