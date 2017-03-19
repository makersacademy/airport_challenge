require 'weather'

describe Weather do

  describe '#stormy' do

    it 'weather is stormy less than 40% of the time' do
      counter = 0
      100.times do
        weather = Weather.new
        counter += 1 if weather.stormy?
      end
      expect(counter > 40).to eq false
    end

    it 'weather is stormy more than 5% of the time' do
      counter = 0
      100.times do
        weather = Weather.new
        counter += 1 if weather.stormy?
      end
      expect(counter > 5).to eq true
    end
  end
end
