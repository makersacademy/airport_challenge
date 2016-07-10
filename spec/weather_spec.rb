require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  it { is_expected.to(respond_to(:stormy?)) }
  it { is_expected.to(respond_to(:random_number)) }
  it { is_expected.to(respond_to(:change_weather)) }

  describe '#change_weather' do
    it 'changes the weather to stormy when random_number equals 1' do
      allow(weather).to receive(:random_number) { 1 }
      weather.random_number
      weather.change_weather
      expect(weather.stormy?).to(equal(true))
    end
    it 'changes the weather to fair for all other random_numbers' do
      allow(weather).to receive(:random_number) { 5 }
      weather.random_number
      weather.change_weather
      expect(weather.stormy?).to(equal(false))
    end
  end

end
