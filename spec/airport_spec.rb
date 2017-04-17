require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  context 'weather is ok' do

    describe '#land(plane)' do
      it { is_expected.to respond_to(:land).with(1).argument }

      it 'should allow a plane to land' do
        allow(plane).to receive(:land) {:landed}
        airport.land(plane)
        expect(airport.planes).to include plane
      end

      it 'raises an error when the airport is full' do
        allow(plane).to receive(:land)
        100.times {airport.land(plane)}
        expect { airport.land(plane) }.to raise_error 'airport is full'
      end
    end

    describe '#take_off(plane)' do
      it { is_expected.to respond_to(:take_off).with(1).argument }

      it 'should allow a plane to takeoff' do
        allow(plane).to receive(:land) {:landed}
        allow(plane).to receive(:take_off) {:taken_off}
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.planes).not_to include plane
      end
    end
  end

  context 'weather is stormy' do

    describe '#land(plane)' do
      it 'raises an error when stormy' do
      end
    end
  end
end
