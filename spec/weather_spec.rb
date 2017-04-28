require 'weather'

describe Weather do

  it { is_expected.to respond_to(:stormy?)}

  describe '#condition_sample' do
    it 'should return sunny from conditions' do
      allow(subject).to receive(:condition_sample) { :sunny }
      expect(subject.condition_sample).to eq :sunny
    end
    it 'should return stormy from conditions' do
      allow(subject).to receive(:condition_sample) { :stormy }
      expect(subject.condition_sample).to eq :stormy
    end
  end

  describe '#stormy?' do
    it 'should return false if sunny is selected from condition_sample' do
    allow(subject).to receive(:random_condition) { :sunny }
    expect(subject.stormy?).to eq false
    end
    it 'should return true if sunny is selected from condition_sample' do
    allow(subject).to receive(:random_condition) { :stormy }
    expect(subject.stormy?).to eq true
    end
  end
end
