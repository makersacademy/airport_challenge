require 'weather'

describe Weather do

  subject(:weather) { described_class.new }

    it 'can return true or false, depending on weather' do
      expect(weather.stormy?).to be(true).or be(false)
    end

end
