require 'weather'

describe Weather do

  describe '#stormy?'do
    it { is_expected.to respond_to :stormy? }

    it 'should report the stormy as false when rand is 7 or less' do
      allow(subject).to receive(:rand) { 7 }
      expect(subject.stormy?).to eq false
    end

    it 'should report stormy as true when rand over 8' do
      allow(subject).to receive(:rand) { 9 }
      expect(subject.stormy?).to eq true
    end
  end

end