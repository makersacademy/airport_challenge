require 'weather'

describe Weather do

  let(:weather) { Weather.new }

  it { is_expected.to respond_to(:stormy?) }

  describe 'stormy' do
    it 'returns true in stormy weather' do
      allow(weather).to receive(:stormy?).and_return(true)
      expect(weather.stormy?).to eq true
    end
  end
end
