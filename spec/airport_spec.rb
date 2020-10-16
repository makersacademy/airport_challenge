require 'airport'

RSpec.describe Airport do

  describe 'land' do
    it 'land a plane at an airport' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.airport_array.length).to eq 1
    end
  end
  
end

RSpec.describe Plane do

end
