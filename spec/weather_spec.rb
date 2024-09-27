require 'weather'

describe Weather do
  let(:subject) {described_class.new}

  describe 'by default' do
    it 'weather is sunny' do
      weather = Weather.new
      expect(weather.sunny).to be true
    end
  end
  
  describe '#get_weather' do
    it 'can be sunny' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(5)
      weather = Weather.new
      expect(weather.sunny?).to eq true
    end
    it 'can be not sunny' do
      allow_any_instance_of(Weather).to receive(:rand).and_return(4)
      weather = Weather.new
      expect(weather.sunny?).to eq false
    end
  end
end
