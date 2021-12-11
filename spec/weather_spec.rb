require 'weather'

describe Weather do
  let(:weather) { Weather.new }

  it { is_expected.to respond_to(:generate) }

  describe '#generate' do
  
    it 'returns "sunny" or "stormy"' do
      expect(weather.generate).to eq('stormy').or eq('sunny')
    end
  end
end

