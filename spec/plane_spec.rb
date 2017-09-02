require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#land' do

    it 'responds to #land' do
      expect(plane).to respond_to(:land).with(1).argument
    end

  end

end
