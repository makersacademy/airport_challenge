require 'weather'

describe Weather do
subject(:weather) { described_class.new }

  context "#stormy?"

    it 'checks if weather is stormy' do
      allow(weather).to receive(:random_weather) { :stormy }
      expect(weather).to be_stormy
    end


end
