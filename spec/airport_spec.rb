require "airport"

describe Airport do
  subject(:airport) { described_class.new(20, weather) }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  describe '#land' do
    context 'when not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end

      it "instructs a plane to land" do
        expect(airport).to respond_to(:land).with(1).argument
      end

      context 'when full' do
        it "does not allow landing when at capacity" do
          20.times { airport.land(plane) }
          expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full."
        end
      end
    end

    context 'when stormy' do
      it 'raises an error if asked to land a plane when stormy' do
        allow(weather).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error "Cannot land plane: weather is stormy."
      end
    end
  end

  describe '#take-off' do
    context 'when not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end
      it "instructs a plane to take-off" do
        expect(airport).to respond_to(:take_off).with(1).argument
      end
    end

    context 'when stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return true
      end
      it 'raises an error' do
      expect {airport.take_off(plane) }.to raise_error "Cannot take-off: weather is stormy."
      end
    end


  end

end
