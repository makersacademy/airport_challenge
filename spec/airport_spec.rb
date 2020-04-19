require 'airport'

RSpec.describe Airport do
  describe '#full' do
    context 'when population is higher than capacity' do
      it 'returns true' do
        airport = described_class.new(airport_population: 1, airport_capacity: 0)
        allow(airport).to receive(:full?) { true }
      end
      it 'returns false' do
        airport = described_class.new(airport_population: 0, airport_capacity: 1)
        allow(airport).to receive(:full?) { false }
      end
    end
  end
end
