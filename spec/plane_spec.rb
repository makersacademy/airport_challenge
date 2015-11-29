require "plane.rb"

describe Plane do
  describe '#landed' do
    it 'can confirm that is has landed' do
      airport = Airport.new
      airport.land(subject)
      expect(subject.flying).to eq(false)
    end
  end

  describe '#taking_off' do
    it 'can confirm that is has took off' do
      airport = Airport.new
      airport.land(subject)
      airport.take_off(subject)
      expect(subject.flying).to eq(true)
    end
  end
end
