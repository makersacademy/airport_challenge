require 'weather'

describe Weather do
  describe '#stormy' do
    it 'is true' do
      weather = Weather.new(true)
      expect(weather).to be_stormy
    end

    it 'is false' do
      weather = Weather.new(false)
      expect(weather.stormy?).to be_falsey
    end

  end
end
