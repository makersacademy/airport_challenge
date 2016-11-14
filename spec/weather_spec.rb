require 'weather'

describe Weather do

  context 'Weather status' do

    it 'checks whether the Weather instance responds to current weather method' do
      expect(subject).to respond_to(:current_weather)
    end

    it 'checks whether the weather is random' do
      expect([:stormy, :sunny]).to include(subject.current_weather)
    end

    it 'checks whether the weather is sunny?' do
      allow(subject).to receive(:is_sunny?).and_return true
      expect(subject.is_sunny?).to eq true
    end
  end
end
