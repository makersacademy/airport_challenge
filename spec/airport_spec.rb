require 'airport.rb'

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double :plane }

  describe '#land' do
    context 'When not stormy' do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it "Instructs a plane to land" do
        expect(airport).to respond_to(:land).with(1).argument
      end

    context 'When full' do
      it 'raises an error' do
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error 'Cannot land plane; Airport full'
      end
    end
  end

    context 'When stormy' do
      it 'raises an error' do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error 'Cannot land plane; Weather is stormy!'
      end
    end
  end

  describe '#take_off' do
    # "I would like to instruct a plane to land"
    it 'Instructs a plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end
end
