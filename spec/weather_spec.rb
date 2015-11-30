require 'weather'

describe Weather do
  let(:airport) { Class.new { extend Weather } }

  describe '#stormy?' do
    context 'in sunny weather' do
      it 'can confirm that weather is not stormy' do
        allow(airport).to receive(:rand).and_return 1
        expect(airport.stormy?).to eq false
      end
    end

    context 'in stormy weather' do
      it 'can confirm that weather is stormy' do
        allow(airport).to receive(:rand).and_return 0
        expect(airport.stormy?).to eq true
      end
    end
  end
end
