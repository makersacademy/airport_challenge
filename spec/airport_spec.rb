require 'airport'

describe Airport do
  subject(:airport) { described_class.new Airport::DEFAULT_CAPACITY, weather }
  let(:plane1) { double(:Plane, take_off: nil, land: nil, landed?: false) }
  let(:plane2) { double(:Plane, take_off: nil, land: nil, landed?: false) }
  let(:weather) { double(:Weather, stormy?: false) }

  describe '#capacity' do
    it 'has a default capacity constant' do
      expect(Airport::DEFAULT_CAPACITY).to be_a Integer
    end

    it 'accepts a capacity on initialization' do
      expect(Airport.new(10).capacity).to eq 10
    end
  end

  describe '#change_capacity' do
    it 'can have the capacity changed' do
      airport.change_capacity Integer
      expect(airport.capacity).to eq Integer
    end
  end

  describe '#land' do
    it 'lands a plane in good weather' do
      airport.land plane1
      expect(airport.planes).to include plane1
    end

    it 'doesn\'t land a plane if the plane is landed' do
      allow(plane1).to receive(:landed?).and_return(true)
      message = 'Plane already landed!'
      expect{ airport.land plane1 }.to raise_error message
    end

    it 'doesn\'t land a plane in bad weather' do
      allow(weather).to receive(:stormy?).and_return(true)
      message = 'Bad weather!'
      expect{ airport.land plane1 }.to raise_error message
    end

    it 'tells the plane to land' do
      expect(plane1).to receive(:land).with airport
      airport.land plane1
    end

    it 'doesn\'t allow the plane to land if full' do
      airport.capacity.times { airport.land plane1 }
      message = 'Airport full - cant\'t land!'
      expect{ airport.land plane1 }.to raise_error message
    end
  end

  describe '#take_off' do
    it 'removes a plane from airport when it leaves' do
      airport.land plane1
      airport.land plane2
      airport.take_off plane1
      expect(airport.planes).not_to include plane1
      expect(airport.planes).to include plane2
    end

    it 'doesn\'t allow plane to take off in bad weather' do
      allow(weather).to receive(:stormy?).and_return(true)
      message = 'Bad weather!'
      expect{ airport.take_off plane1 }.to raise_error message
    end

    it 'doesn\'t allow plane to take off if not at airport' do
      message = 'Not at airport - cant\'t take off!'
      expect{ airport.take_off plane1 }.to raise_error message
    end

    it 'tells a plane to take off' do
      airport.land plane1
      expect(plane1).to receive(:take_off)
      airport.take_off plane1
    end
  end
end
