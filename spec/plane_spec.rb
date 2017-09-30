require 'plane'

class FakeAirport

end

describe Plane do
  subject(:plane) { Plane.new }
  describe "#land" do
    it 'lands a plane at an airport' do
      expect(plane.land(FakeAirport.new)).not_to be_nil
    end
  end


end
