require 'weather'

describe Weather do

  describe '#report' do
    it{is_expected.to respond_to :report}

    it 'should report the current weather conditions' do
      expect(subject.report).to eq subject.forecast
    end
  end

  describe '#forecast'do
    it{is_expected.to respond_to :forecast}

    it 'should report the weather as sunny when atmos is 7 or less' do
      allow(subject).to receive(:atmosphere) { atmos = 6 }
      expect(subject.forecast).to eq 'sunny'
    end

    it 'should report the weather as stormy when atmos over 8' do
      allow(subject).to receive(:atmosphere) { atmos = 9 }
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
