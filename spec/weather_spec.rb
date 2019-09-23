require 'weather'

describe Weather do
  include Weather

  describe '#stormy?' do
    it { expect(stormy?).to be(true).or be(false) }
  end

end
