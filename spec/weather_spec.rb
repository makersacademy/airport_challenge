require 'weather'

describe Weather do

  describe '#report' do
    it{is_expected.to respond_to :report}
  end

  describe '#forecast'do
    it{is_expected.to respond_to :forecast}

    it 'should report that the weather is sunny' do
      allow(subject).to receive(:atmosphere) { 8 }
      expect(subject.forecast).to eq 'sunny'
    end

    it 'should report that the weather is stormy' do
      allow(subject).to receive(:atmosphere) { 9 }
      expect(subject.forecast).to eq 'stormy'
    end
  end

  describe '#atmosphere' do
    it{is_expected.to respond_to :atmosphere}

    it 'should generate a random number between 1 and 10' do
      expect(subject.atmosphere).to be_between(0, 10).inclusive
    end
  end

end
