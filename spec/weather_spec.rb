require 'weather'

RSpec.describe WeatherConditions do
  describe '#stormy?' do
    it 'returns 3' do
      allow(subject).to receive(:stormy?).and_return(3)
    end

    it 'returns true' do
      allow(subject).to receive(:good?).and_return(true)
    end
  end
end
