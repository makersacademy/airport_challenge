require 'plane'

describe Plane do
  describe '#land' do
    it 'expects to be called with one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'asks the airport if it can land' do
    end
  end

  describe '#takeoff' do
    it 'expects to be called with one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'asks the airport if takeoff is possible' do

    end
  end
end
