require 'airport'

describe Airport do
  subject(:airport) {described_class.new(20)}
  let(:plane) { double :plane }

  describe '#land' do
    it 'should allow a plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    context 'when airport is full' do
      it 'raises landing error' do
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error 'Plane unable to land, airport full'
      end
    end
  end

  describe '#take_off' do
    it 'should allow a plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end
end
