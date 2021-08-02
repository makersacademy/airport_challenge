require "weather"

describe Weather do
  let(:forecast) { instance_double(Weather) }

  describe '#stormy?' do
    it { is_expected.to respond_to(:stormy?) }

    it '#stormy? returns boolean' do
      allow(forecast).to receive(:stormy?).and_return(true)
      expect(forecast.stormy?).to eq(true)
    end

    it '#stormy? returns boolean' do
      allow(forecast).to receive(:stormy?).and_return(false)
      expect(forecast.stormy?).to eq(false)
    end
  end
end

  # let(:weather) { class_double(Weather).as_stubbed_const }

  # it '#stormy? returns boolean' do
  #   expect(Weather.stormy?).to eq(true).or eq(false)
  # end
