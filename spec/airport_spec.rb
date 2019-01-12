require 'airport'

RSpec.describe Airport do
  describe 'can land and take off planes' do

    it 'should allow a plane to land' do
      airport = Airport.new
      plane1 = Plane.new
      expect(airport.land(plane1)).to eq [plane1]
    end

    it 'should allow a plane to take-off' do
      airport = Airport.new
      plane1 = Plane.new
      expect(airport.takeoff(plane1)).to eq plane1
    end
  end
end
