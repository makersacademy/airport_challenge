require 'weather'

RSpec.describe Weather do
  describe '#stormy?' do
    context 'stormy' do
      before do
        allow(subject).to receive(:rand).and_return 16
      end 
      it 'weather is stormy' do
        expect(subject.stormy?).to eq true
      end
    end

    context 'not stormy' do
      before do
        allow(subject).to receive(:rand).and_return 5
      end
      it 'weather is not stormy' do
        expect(subject.stormy?).to eq false
      end
    end
  end
end
