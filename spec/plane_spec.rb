require 'plane'

describe Plane do

  describe '#land' do

    it 'responds to #land' do
      expect(subject).to respond_to(:land).with(1).argument
    end

  end

end
