require "plane.rb"

describe Plane do
  describe '#landed' do
    it 'can confirm that is has landed' do
      airport = Airport.new
      airport.land(subject)
      expect(subject.flying).to eq(false)
    end
  end
end
