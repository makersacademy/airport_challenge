require 'weather'

  describe Weather do
      subject(:weather) { described_class.new }
      subject(:plane) { described_class.new }

    it 'should return sunny' do
      allow(subject).to receive(:rand).and_return(2)
      expect(subject.stormy?).to eq false
    end

    it 'should return stormy' do
      allow(subject).to receive(:rand).and_return(0)
      expect(subject.stormy?).to eq true
    end

  end
