require 'plane'
require 'airport'

describe Plane do

  describe "#status" do
    it 'tells if the plane is flying' do
      airport = Airport.new
      airport.land(subject)
      airport.take_off(subject)
      expect(subject.status).to eq "Plane is flying"
    end
    it 'tells if the plane is in the airport' do
      airport = Airport.new
      airport.land(subject)
      expect(subject.status).to eq "Plane is in the airport"
    end
  end

end
