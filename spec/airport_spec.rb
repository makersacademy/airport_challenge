require 'airport'
require 'plane'

plane = Plane.new

describe Airport do

  describe '#initialize' do
    context 'with parameters' do
      let(:airport) { Airport.new(5000) }

      it 'should create an airport with a capacity of 5000' do
        big_airport = Airport.new(5000)
        expect(big_airport.capacity).to eq 5000
      end
    end
  end

  describe '#land' do
    it 'raises an error when the airport is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport is full'
    end

    it 'should allow planes to land during sunny conditions' do
      subject.weather_condition = :sunny
      expect { subject.land(plane) }.to eq planes.include(plane)
    end

    it 'should not allow planes to land during stormy conditions' do
      subject.weather_condition = :stormy
      expect { subject.land(plane) }.to raise_error 'Cannot land due to storms'
    end

    it 'raise an error when the plane asked to land is already at airport' do
      @planes << plane
      expect { subject.land(plane) }.to raise_error 'Plane is already at the airport!'
    end
  end

  describe '#take_off' do

    it 'allows a plane to take off in sunny conditions' do
      subject.weather_condition = :sunny
      expect(subject.take_off(plane)).to eq "#{plane} has just taken off"
    end

    it 'does not allow a plane to take off in stormy conditions' do
      subject.take_off(plane)
      subject.weather_condition = :stormy
      expect(subject.take_off).to raise_error 'Cannot take off due to storms'
    end

    it 'raises an error when the plane in question is not present' do
      if planes.include?(plane) == false
      expect { subject.take_off }.to raise_error 'Plane not present'
      end
      end
  end
  end