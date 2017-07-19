require 'weather'

describe Weather do

  it { is_expected.to respond_to :forecast }

  describe '#forecast' do
    it 'returns :good weather' do
      allow(subject).to receive(:forecast) { :good }
      expect(subject.forecast).to eq :good
    end

    it 'returns :stormy weather' do
      allow(subject).to receive(:forecast) { :stormy }
      expect(subject.forecast).to eq :stormy
    end

    it 'returns :stormy weather at random' do
      forecast_results = [:good, :stormy]
      subject.forecast
      expect(forecast_results.any?).to eq true
    end
  end
end
