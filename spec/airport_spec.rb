require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }

  describe '#take_off' do
    it 'raises error if no planes avaliable to take_off' do
      expect { subject.take_off }.to raise_error
    end
  end

  describe '#land' do
    it 'raises error if try to land plane when plane already landed' do
      expect { subject.land }.to raise_error
    end
  end

end
