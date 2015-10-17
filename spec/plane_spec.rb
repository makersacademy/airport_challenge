require 'plane'

describe Plane do
    it { is_expected.to respond_to(:land).with(1).argument }

    it { is_expected.to respond_to(:take_off).with(1).argument }

    context 'when the airport is full' do
      it 'does not allow planes to land' do
        airport = Airport.new
        airport.weather = 80
        airport.capacity.times do
          plane = Plane.new
          plane.land(airport)
        end
        airport.full?
        expect { subject.land(airport) }.to raise_error 'The airport is currently full'
      end
    end

    context 'when the weather is stormy' do
      it 'does not allow planes to land' do
        airport = Airport.new
        airport.weather = 95
        expect { subject.land(airport) }.to raise_error 'Cannot land in stormy weather'
      end
    end

    context 'when a plane is attempting to take off from an airport it is not currently stationed at' do
      it 'does not take off' do
        airport = Airport.new
        airport.weather = 80
        another_airport = Airport.new
        another_airport.weather = 80
        subject.land(airport)
        expect { subject.take_off(another_airport) }.to raise_error 'You cannot take off from that airport'
      end
    end

    context 'when a plane is flying' do
      it 'cannot take_off' do
        airport = Airport.new
        expect { subject.take_off(airport) }.to raise_error 'You are already flying'
      end


      it 'cannot be in an airport' do
        airport = Airport.new
        airport.weather = 80
        subject.land(airport)
        subject.take_off(airport)
        expect(subject.location).to_not eq(airport.location)
      end
    end

    context 'when a plane is not flying' do
      it 'cannot land' do
        airport = Airport.new
        subject.land(airport)
        expect { subject.land(airport) }.to raise_error 'You are not flying'
      end

      it 'must be in an airport' do
        airport = Airport.new
        airport.weather = 80
        subject.land(airport)
        expect(subject.location).to eq(airport.location)
      end

    end
end
