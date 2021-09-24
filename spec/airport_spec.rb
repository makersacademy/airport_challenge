require 'airport_class'
require 'plane_class'

RSpec.describe Airport do 
  describe 'instruct a plane to land at an airport' do
    it 'should land a plane at an airport' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq [plane]
    end   
    it 'should instruct plane to take off' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.take_off(plane)).to eq "Plane has taken off"
    end  
    # it 'should confirm plane no longer in airport' do
    #   airport = Airport.new
    #   plane = Plane.new
    #   airport.take_offplane)
    #   expect(airport.land(plane)).to eq plane
    # end  

      
  end 
end      
    