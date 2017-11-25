require 'airport'
require 'plane'

describe Plane do
  describe "#land" do
    it 'has landed at the airport and should not be flying' do
      airport = Airport.new
      airport.land(subject)
      expect(subject.flying).to eq false
    end
  end

  describe "#take_off" do
    it 'has taken off and confirms that it is no longer in the airport' do
      airport = Airport.new
      airport.land(subject)
      airport.take_off(subject)
      expect(subject.flying).to eq true
    end
  end



end
