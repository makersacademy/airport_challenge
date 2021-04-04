require 'weather'

describe Weather do
  subject { described_class }

  describe '.stormy?' do
    it { is_expected.to respond_to(:stormy?) }

    it 'check that random stormy? return is not too often true' do
      trues = 0
      50.times { trues += 1 if subject.stormy? }
      expect(trues).to be < 25
    end

    it 'check that random stormy? return is not too often false' do
      trues = 0
      50.times { trues += 1 if subject.stormy? }
      expect(trues).to be > 2
    end
  end
end
