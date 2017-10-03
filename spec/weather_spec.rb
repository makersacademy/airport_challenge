require 'weather'

describe Weather do
  describe '#stormy?' do
    it 'generates a boolean for deciding weather pattern' do
      expect(subject.stormy?).to be(true).or be(false)
    end
    it 'produces a mostly non stormy response' do
      weather_pattern = []
      100_00.times { weather_pattern << subject.stormy? }
      true_count = 0
      weather_pattern.each { |weather| true_count += 1 if weather == true }
      true_count = true_count.to_f / 100_00
      expect(true_count).to be <= 0.1
    end
  end
end
