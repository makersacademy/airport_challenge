require 'plane'
require 'airport'

describe Plane do

    it "lands a plane at an airport" do
        airport = Airport.new
        subject.land(airport)
        expect(airport.hanger.last).to eq subject
      end

end