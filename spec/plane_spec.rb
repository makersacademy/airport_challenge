require 'plane'
require 'airport'

describe Plane do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'confirms it has taken off' do
      airport = Airport.new
      subject.land(airport)
      expect { subject.take_off }.to output("[plane has taken off from airport]\n").to_stdout
    end
  end
end
