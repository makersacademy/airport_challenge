require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  describe '#land' do
    it 'stores the airport the plane landed at' do
      plane.land(airport)
      expect(plane.airport).to eq airport
    end

    context 'if already landed' do
      it 'raises an error' do
        plane.land(airport)
        expect { plane.land(airport) }.to raise_error 'The plane has already landed.'
      end
    end
  end

  describe '#take_off' do
    it { expect(plane).to respond_to :depart }

    context 'if already flying' do
      it 'raises an error' do
        expect { plane.depart }.to raise_error 'The play is currently flying. It is not at an airport.'
      end
    end
  end

  describe '#airport' do
    it { expect(plane).to respond_to :airport }

    context 'if already flying' do
      it 'raises an error' do
        expect { plane.airport }.to raise_error 'The plane is not currently at an airport. The plane is flying.'
      end
    end
  end
end
