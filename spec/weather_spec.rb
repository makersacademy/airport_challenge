require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#stormy' do
    it 'less than 40% of the time' do
      counter = 0
      100.times do
        counter += 1 if weather.stormy?
      end
      expect(counter > 40).to eq false
    end

    it 'more than 5% of the time' do
      counter = 0
      100.times do
        counter += 1 if weather.stormy?
      end
      expect(counter > 5).to eq true
    end
  end
end
