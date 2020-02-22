require "airport"
require "plane"

describe Plane do

  describe '#land' do
    it { is_expected.to respond_to(:land) }
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }
  end
end
