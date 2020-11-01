require 'Airport'

describe Airport do
  describe '#planes' do
    it "shows the list of planes at the airport" do
      boeing = Plane.new
      heathrow = Airport.new
      boeing.land(heathrow)
      expect(heathrow.planes).to eq [boeing]

    end
  end

end
