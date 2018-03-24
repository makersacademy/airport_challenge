require 'airport'

describe Airport do

  describe '#stormy?' do

    it { is_expected.to respond_to(:stormy?) }

  end

end

describe Airplane do

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'expects the argument to be an instance of Airport' do
      expect { subject(:land).(instance_of(Airport)) }
    end

  end

end
