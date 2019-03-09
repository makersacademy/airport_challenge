require 'weather'

describe Weather do

  describe '#random' do

    it { is_expected.to respond_to :random }

    it 'can return a random number for use in the stormy method' do
      expect(subject.random).to be_between(1, 100).inclusive
    end
  end

  describe '#stormy?' do
    it { is_expected.to respond_to :stormy? }

    it 'returns true most of the time' do
      expect(subject).to receive(:random).and_return 96
      expect(subject.stormy?).to eq true
    end

    it 'returns false on rare occasions' do
      expect(subject).to receive(:random).and_return 7
      expect(subject.stormy?).to eq false
    end
  end
end
