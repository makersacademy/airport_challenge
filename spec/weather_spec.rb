require 'weather'

describe Weather do
  let(:weather) { Weather.new }

  it { is_expected.to respond_to(:generate) }

  describe '#generate' do
  
    it 'returns "sunny" or "stormy"' do
      expect(weather.generate).to eq('stormy').or eq('sunny')
    end

    it 'returns "stormy" when randomiser is 4' do
      weather = Weather.new
      allow(weather).to receive(:rand) { 4 }
      expect(weather.generate).to eq('stormy')
    end
    
    it 'returns "sunny when randomiser is 3' do
      weather = Weather.new
      allow(weather).to receive(:rand) { 3 }
      expect(weather.generate).to eq('sunny')
    end

    it 'returns "sunny when randomiser is 0' do
      weather = Weather.new
      allow(weather).to receive(:rand) { 0 }
      expect(weather.generate).to eq('sunny')
    end

  end
end
