require 'weather'

describe Weather do

  describe '#stormy?'do
    it{is_expected.to respond_to :stormy?}

    it 'should report the stormy as false when atmos is 7 or less' do
      allow(subject).to receive(:atmosphere) { atmos = 6 }
      expect(subject.stormy?).to eq false
    end

    it 'should report stormy as true when atmos over 8' do
      allow(subject).to receive(:atmosphere) { atmos = 9 }
      expect(subject.stormy?).to eq true
    end
  end

  describe '#atmosphere' do
    it{is_expected.to respond_to :atmosphere}

    it 'should generate a random number between 1 and 10' do
      expect(subject.atmosphere).to be_between(0, 10).inclusive
    end
  end

end
