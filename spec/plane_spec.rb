require 'plane'

describe Plane do

  describe "#landed" do
    it "returns true if plane is landed, false if not" do
      airport = Airport.new
      airport.land(subject)
      expect(subject.landed).to eq true
      airport.take_off
      expect(subject.landed).to eq false
    end
  end

end
