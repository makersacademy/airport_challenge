require 'plane'

describe Plane do
  subject { described_class.new }

  describe '#land?' do
    it { expect(subject.land?).to eq true }
  end
end
