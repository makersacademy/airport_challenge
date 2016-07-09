require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

  context '#stormy?' do

    it { is_expected.to respond_to :stormy? }
    weather = Weather.new
    it 'checks if the weather is stormy' do
      expect(weather.stormy?).to eq 'It is stormy'

    end

  end

end
