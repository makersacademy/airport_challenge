require 'airport'
require 'weather'
require 'plane'
describe Airport do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it 'the plane can be landed when the weather is sunny' do
      expect { subject.land(double(:plane)) }.not_to raise_error
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it 'the plane can take off when the weather is sunny' do
      expect { subject.take_off(double(:plane)) }.not_to raise_error
    end
  end
end
