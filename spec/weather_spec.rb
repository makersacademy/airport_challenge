require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe 'stormy' do
    it 'should return true or false if stormy' do
      expect(weather.stormy?).to eq(true).or eq(false)
    end
  end
end
