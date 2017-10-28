require 'airport'

describe Airport do


  describe '#full?' do
    it { expect(subject.full?).to be(true).or be(false) }
  end
end
