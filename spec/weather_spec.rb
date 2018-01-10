require 'weather.rb'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#initialize' do
    it 'should set the weather to clear or stormy' do
      expect(Weather::CURRENT_CONDITIONS).to include subject.weather
    end
  end
end
