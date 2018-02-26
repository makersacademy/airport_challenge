require 'airport'
require 'plane'
describe Airport do

  describe "#planes" do
    it 'respond to planes method' do
      expect(Airport.new).to respond_to :planes
    end
  end

  it 'stores landed planes' do
    plane, airport = Plane.new, Airport.new
    plane.land_at(airport)
    expect(airport.planes).to eq plane
  end

end
