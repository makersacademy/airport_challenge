require 'weather'

describe Weather do
  describe '#current' do
    it 'is stormy when above 95' do
      allow(subject).to receive(:random_integer) { 96 }
      expect(subject.current).to eq "stormy"
    end
    it 'is sunny when below 96' do
      allow(subject).to receive(:random_integer) { 95 }
      expect(subject.current).to eq "sunny"
    end
  end
  describe '#random_integer' do
    it { expect(subject.random_integer).to be_integer }
  end
end
