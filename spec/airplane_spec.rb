require 'airplane'

describe Airplane do
  let(:mockAirport) { double :airport, :land => nil, :takeoff => nil }

  context 'when plane in in the air' do
    describe '.land' do
      it 'lands the plane at an airport' do
        expect(subject.land(mockAirport))
          .to eq 'Plane has landed'
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
      it 'makes the plane take off' do
        expect(subject.takeoff(mockAirport))
          .to eq 'Plane has taken off'
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
