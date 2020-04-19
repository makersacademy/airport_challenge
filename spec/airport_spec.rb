require 'airport'

RSpec.describe Airport do
  describe '#airport_full' do
    context 'when population is higher than capacity' do
      it 'returns true' do
        data = described_class.new(2, 1)
        allow(data).to receive(:airport_full?) { true }
      end
      it 'returns true' do
        data = described_class.new(1, 1)
        allow(data).to receive(:airport_full?) { false }
      end
      it 'returns false' do
        data = described_class.new(1, 2)
        allow(data).to receive(:airport_full?) { false }
      end
    end
  end
end
