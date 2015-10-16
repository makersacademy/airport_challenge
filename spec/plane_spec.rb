require 'plane'

describe Plane do
    it { is_expected.to respond_to(:land) }

    it { is_expected.to respond_to(:take_off) }

    context 'when the airport is full' do
      it 'does not allow planes to land' do
        airport = Airport.new
        airport.full?
        expect { subject.land(airport) }.to raise_error 'The airport is currently full'
      end
    end
end
