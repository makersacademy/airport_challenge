require 'plane'

describe Plane do
  let(:landed) { false }
  subject(:plane) { Plane.new(landed) }

  describe '#landed?' do
    subject { plane.landed? }

    context 'when plane is landed' do
      let(:landed) { true }

      it 'returns true' do
        expect(subject).to be(true)
      end
    end

    context 'when plane is in the air' do
      let(:landed) { false }

      it 'returns false' do
        expect(subject).to be(false)
      end
    end
  end

  describe '#flying?' do
    subject { plane.flying? }

    context 'when plane is landed' do
      let(:landed) { true }

      it 'returns false' do
        expect(subject).to be(false)
      end
    end

    context 'when plane is in the air' do
      let(:landed) { false }

      it 'returns true' do
        expect(subject).to be(true)
      end
    end
  end
end
