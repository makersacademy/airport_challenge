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
    it 'tells the aiport that it\'s landing if it was possible' do
      airport_double = double(:airport, :can_land? => true)
      expect(airport_double).to receive(:landing).with(subject)
      subject.land airport_double
    end
    it 'does not tell the aiport that it\'s landing if it was not possible' do
      airport_double = double(:airport, :can_land? => false)
      expect(airport_double).not_to receive(:landing)
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
