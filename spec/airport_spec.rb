require 'airport.rb'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double :plane }

  describe '#land' do
    context 'when not stormy' do

      it "instructs a plane to land" do
        allow(airport).to receive(:stormy?).and_return false
        expect(airport).to respond_to(:land).with(1).argument
      end

      context 'when full' do
        it 'raises an error' do
          allow(airport).to receive(:stormy?).and_return false
          20.times do
            airport.land(plane)
          end

          expect { airport.land(plane) }.to raise_error 'Cannot land plane; Airport full'
        end

      end

    end

    context 'when stormy'
      it 'raises an error if asked to land a plane when stormy' do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error 'Cannot land plane; Weather is stormy!'
      end
    end

    describe '#take_off' do
      # "I would like to instruct a plane to land"
      it 'instructs a plane to take off' do
        expect(airport).to respond_to(:take_off).with(1).argument
      end
    end
end
