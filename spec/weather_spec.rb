require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#stormy?' do
    context 'in sunny weather' do
      it 'can confirm that weather is not stormy' do
       allow(weather).to receive(:rand) { 1 }
        expect(subject.stormy?).to eq false
      end
    end

    context 'in stormy weather' do
      it 'can confirm that weather is stormy' do
        allow(weather).to receive(:rand) { 0 }
        expect(subject.stormy?).to eq true
      end
    end
  end
end
