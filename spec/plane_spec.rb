require 'plane'

describe Plane do
  class FakeAirport
    def land_plane(plane)
      plane.landed = true
    end
  end
  describe '#landed?' do
    it "will show if plane has landed at airport" do
      jfk = FakeAirport.new
      jfk.land_plane(subject)
      expect(subject.landed?).to eq subject.landed
    end
  end
end
