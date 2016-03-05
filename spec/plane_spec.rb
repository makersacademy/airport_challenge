require 'plane'

describe Plane do
  let(:airport) { double(:Airport) }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument}
  end

  

  describe '#take_off' do

  end
end
