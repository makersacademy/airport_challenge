require 'airplane'

describe Airplane do
  let(:mockAirport) { double :airport, :store => nil, :remove => nil }

  context 'when plane in in the air' do
    describe '.land' do
      it 'lands the plane at an airport' do
        expect(subject.land(mockAirport))
          .to eq 'plane has landed at airport'
      end
    end

    describe '.takeoff' do
      it 'raises an error' do
        expect { subject.takeoff(mockAirport) }
          .to raise_error 'Plane is already in the air'
      end
    end
  end

  context 'when plane is on the ground' do
    before(:each) do
      subject.land(mockAirport)
    end

    describe '.takeoff' do
      it 'makes the plane leave the airport' do
        expect(subject.takeoff(mockAirport))
          .to eq 'plane has left airport'
      end
    end

    describe '.land' do
      it 'raises an error' do
        expect { subject.land(mockAirport) }
          .to raise_error 'Plane has already landed'
      end
    end
  end
end
