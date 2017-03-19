require './lib/airport.rb'

describe Airport do

  before do
    allow(subject.weather).to receive(:is_sunny?) { false }
  end

  describe 'Test airport capacity' do
    it 'Default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'Set capacity' do
      random_number = rand(100)
      airport = Airport.new(random_number)
      expect(airport.capacity).to eq random_number
    end

    it 'Full capacity' do
      expect{ (Airport::DEFAULT_CAPACITY + 1).times do
        plane = double(:planes, plane_landed: true, land: true)
        subject.land(plane)
      end
      }.to raise_error 'Airport capacity is full'
    end
  end

  describe 'Test Plane lands at airport' do
    it 'Landing' do
      plane = double(:planes, land: true)
      expect(subject.land(plane)).to eq [plane]
    end

    it 'Confirm landing' do
      plane = double(:planes, land: true)
      subject.land(plane)
      expect(subject.in_airport?(plane)).to eq true
    end

    it 'Error: Landing plane cannot land again' do
      plane = double(:planes, land: true)
      subject.land(plane)
      expect{ subject.land(plane) }.to raise_error 'The plane has already landed'
    end

    it 'Stormy weather for landing' do
      allow(subject.weather).to receive(:is_sunny?) { true }
      plane = double(:planes, land: true)
      expect{ subject.land(plane) }.to raise_error 'The weather is too stormy to land'
    end
  end

  describe 'Test Plane takes off at airport' do
    it 'Taking off' do
      plane = double(:planes, land: true, take_off: false)
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'Confirm take off' do
      plane = double(:planes, land: true, take_off: false)
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.in_airport?(plane)).to eq false
    end

    it 'Error: Taken off plane cannot take off again' do
      plane = double(:planes, land: true, take_off: false)
      subject.land(plane)
      subject.take_off(plane)
      expect{ subject.take_off(plane) }.to raise_error 'The plane has already taken off'
    end

    it 'Stormy weather for take off' do
      plane = double(:planes, land: true)
      subject.land(plane)
      allow(subject.weather).to receive(:is_sunny?) { true }
      expect{ subject.take_off(plane) }.to raise_error 'The weather is too stormy to take off'
    end
  end

  describe 'Test weather' do
    it 'Weather is sunny or stormy' do
      expect(subject.is_sunny?).to eq(true).or eq(false)
    end
  end
end
