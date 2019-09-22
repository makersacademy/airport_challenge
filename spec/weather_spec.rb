require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe '#stormy?' do
    it { expect(weather.stormy?).to be(true).or be(false) }
  end

end
