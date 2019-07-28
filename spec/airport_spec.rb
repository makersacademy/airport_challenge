require "airport"
require "plane"
require "weather" 

describe Airport do
    it 'Lands a plane' do
    plane = Plane.new
    subject.land(plane)
    plane.plane_land
  end
end