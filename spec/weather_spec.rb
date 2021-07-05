require 'weather.rb'

describe Weather do

  describe '#rand_weather' do
    it 'gives random weather conditions' do
      weather = Weather.new

      allow(weather).to receive(:sample){'stormy'}

      expect(weather.sample).to eq('stormy')
    end
  end
end
