require 'weather'

describe Weather do
  describe 'stormy?' do
    it 'is true when random number generator returns > 95' do
      allow(subject).to receive(:random_integer) { 96 }
      expect(subject).to be_stormy
    end
    it 'is false when random number generator returns <= 95' do
      allow(subject).to receive(:random_integer) { 95 }
      expect(subject).not_to be_stormy
    end
  end
  describe '#random_integer' do
    it { expect(subject.random_integer).to be_integer }
  end
end
