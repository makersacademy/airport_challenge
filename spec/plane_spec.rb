require 'plane'

describe Plane do
  describe '#land' do
    it 'expects to be called with one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'asks the airport if landing is possible' do
      airport_double = double(:airport)
      expect(airport_double).to receive(:can_land?)
      subject.land airport_double
    end
  end

  describe '#takeoff' do
    it 'expects to be called with one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'asks the airport if takeoff is possible' do
      airport_double = double(:airport)
      expect(airport_double).to receive(:can_takeoff?)
      subject.takeoff airport_double
    end
  end
end
