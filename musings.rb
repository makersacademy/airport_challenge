require './lib/airport'
airport1 = Airport.new
plane1 = Plane.new
plane2 = Plane.new
plane3 = Plane.new
airport1.land(plane1)
airport1.land(plane1) #should raise an error for landing twice
airport1.land(plane2)
airport.takeoff(plane1)
airport.takeoff(plane1) #should raise an error for taking off twice
airport.takeoff(plane3) #should raise an error for taking off without landing
airport2 = Airport.new(1)
plane4 = Plane.new
plane5 = Plane.new
airport2.land(plane4)
airport2.land(plane5) #should raise an error for the airport being full


=begin
  before do
    plane = plane.new
    airport = Airport.new
  end
=end
