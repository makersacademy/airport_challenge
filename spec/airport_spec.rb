require 'airport'

describe Airport do
  let(:plane) { double(:plane, land: true, take_off: true, status: false) }
  let(:weather) { double(:weather, get_weather: 1) }
  let(:capacity) { Airport::DEFAULT_CAPACITY }

  describe '#capacity' do
    it 'sets a default capacity for the airport' do
      message = 'Airport full'
      capacity.times { subject.land(double(:plane, land: true, status: false)) }
      expect{ subject.land(plane) }.to raise_error message
    end

    it 'allows the default capacity to be overriden when initialized' do
      message = 'Airport full'
      airport = Airport.new(20)
      20.times { airport.land(double(:plane, land: true, status: false)) }
      expect{ airport.land(plane) }.to raise_error message
    end
  end

  describe '#land' do
    it 'accepts a plane to land' do
      message = 'Airport full'
      airport = Airport.new(1)
      airport.land(plane)
      expect{ airport.land(plane) }.to raise_error message
    end

    it 'prevents a plane that is in the airport from landing' do
      message = 'Plane has already landed here'
      expect { 2.times { subject.land(plane) }}.to raise_error message
    end

    # cannot get to work with double
    it 'prevents a plane landing at two airports at one time' do
      message = 'Plane has already landed elsewhere'
      plane = Plane.new
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.land(plane)
      expect { airport2.land(plane) }.to raise_error message
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off' do
      message = 'All planes have taken off'
      expect{ subject.take_off(plane) }.to raise_error message
    end

    it 'does not allow a plane to take off from the wrong airport' do
      message = 'Plane is not at this airport'
      expect{ subject.take_off(plane) }.to raise_error message
    end
  end

  describe '#change_weather' do
    it 'prevents a plane taking off in stormy weather' do
      message = 'Plane cannot take off in stormy weather'
      allow(subject).to receive(:rand) { 9 }
      subject.land(plane)
      subject.change_weather
      expect{ subject.take_off(plane) }.to raise_error message
    end

    it 'prevents a plane landing in stormy weather' do
      message = 'Plane cannot land in stormy weather'
      allow(subject).to receive(:rand) { 9 }
      subject.change_weather
      expect{ subject.land(plane) }.to raise_error message
    end
  end
end
