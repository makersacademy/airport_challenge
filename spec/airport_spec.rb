require 'airport'

describe Airport do
  let(:plane) { double(:plane, land: true, take_off: true) }
  let(:new_plane) { double(:plane, land: true, take_off: true) }
  let(:weather) { double(:weather, get_weather: 1) }
  let(:capacity) { Airport::DEFAULT_CAPACITY }

  describe '#capacity' do
    it 'sets a default capacity for the airport' do
      subject.land(plane)
      expect{ (1..capacity).to_a.each{ |x| subject.land(x) } }.to raise_error
      'Airport full'
    end

    it 'allows the default capacity to be overriden when initialized' do
      airport = Airport.new(100)
      airport.land(plane)
      expect{ (1..100).to_a.each { |x| airport.land(x) } }.to raise_error
      'Airport full'
    end
  end

    describe '#land' do
    it 'accepts a plane to land' do
      airport = Airport.new(1)
      airport.land(plane)
      expect{ airport.land(plane) }.to raise_error
      'Airport full'
    end

    it 'prevents a plane that is in the airport from landing' do
      expect { 2.times { subject.land(plane) }}.to raise_error
      'Plane has already landed here'
    end

    # cannot get to work with double
    it 'prevents a plane landed at a different airport from landing' do
      plane = Plane.new
      airport1 = Airport.new
      airport2 = Airport.new
      airport1.land(plane)
      expect { airport2.land(plane) }.to raise_error
      'Plane has already landed elsewhere'
    end

  end

  describe '#take_off' do
    it 'allows a plane to take off' do
      subject.land(plane)
      subject.take_off(plane)
      expect{ subject.take_off(plane) }.to raise_error
      'All planes have taken off'
    end

    it 'does not allow a plane to take off from the wrong airport' do
      subject.land(plane)
      expect{ subject.take_off(new_plane) }.to raise_error
      'Plane is not at this airport'
    end
  end

  describe '#change_weather' do
    it 'prevents a plane taking off in stormy weather' do
      allow(subject).to receive(:rand) { 9 }
      subject.land(plane)
      subject.change_weather
      expect{ subject.take_off(plane) }.to raise_error
      'Plane cannot take off in stormy weather'
    end

    it 'prevents a plane landing in stormy weather' do
      allow(subject).to receive(:rand) { 9 }
      subject.change_weather
      expect{ subject.land(plane) }.to raise_error
      'Plane cannot land in stormy weather'
    end
  end

end