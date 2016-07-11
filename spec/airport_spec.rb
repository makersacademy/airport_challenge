require 'airport'

describe Airport do
  describe '#cap' do
    it 'has a set capacity' do
      airport = Airport.new(28)
      expect(airport.cap).to eq 28
    end
    it 'has a default capacity if none is   predefined' do
      expect(subject.cap).to eq Airport::DEF_CAP
    end
  end

  describe '#docked(plane)' do
    it 'makes a record of all currently landed planes' do
      plane = double(:plane, landed: true)
    end
  end
end
