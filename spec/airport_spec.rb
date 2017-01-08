require 'airport'

describe Airport do # according to the guy who wrote Rspec, you should try to define a named subject whereever possible
  subject(:airport) { described_class.new } #you can make a named statement like you would a let statement
  let(:plane) { double :plane }

  describe '#take_off' do
    context 'when weather is not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it 'instructs a plane to take off' do
        expect(airport).to respond_to(:take_off).with(1).argument # we expect to be able to respond to take_off with one argument
      end
    end

    context 'when weather is stormy' do
      it 'raises an error' do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.take_off(plane) }.to raise_error 'Unable to take off: Weather is stormy'
      end
    end
  end

  describe '#land' do
    context 'when weather is not stormy' do
      it 'instructs a plane to land' do
        expect(airport).to respond_to(:land).with(1).argument
      end
    end

    context 'when weather is stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return true
      end

      it 'raises an error' do
        expect { airport.land(plane) }.to raise_error 'Unable to land: Weather is stormy'
      end
    end
  end
end
