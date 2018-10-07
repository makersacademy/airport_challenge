require 'weather'

describe Weather do
  it 'should have a set chance of stormy weather' do
    described_class::STORM_CHANCE
  end

  describe "#stormy?" do
    it 'should always return true or false' do
      100.times { expect(subject.stormy?).to eq(true).or eq(false) }
    end

    it 'should be true when the random number is less than the storm chance' do
      allow(subject).to receive(:chance).and_return 0.04
      expect(subject.stormy?).to eq true
    end

    it 'should be false when the random number is more than the storm chance' do
      allow(subject).to receive(:chance).and_return 0.06
      expect(subject.stormy?).to eq false
    end
  end
end
