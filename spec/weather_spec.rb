require 'weather'

describe Weather do

  it { is_expected.to respond_to(:condition_sample) }

  it { is_expected.to respond_to(:stormy?)}

  describe '#condition_sample' do
    it 'should allow sunny from CONDITIONS constant' do
      allow(subject).to receive(:condition_sample) { :sunny }
      expect(subject.condition_sample).to eq :sunny
    end
    it 'should allow stormy from CONDITIONS constant' do
      allow(subject).to receive(:condition_sample) { :stormy }
      expect(subject.condition_sample).to eq :stormy
    end
  end

end
