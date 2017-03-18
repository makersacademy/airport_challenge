require './lib/airport'
require './lib/plane'
gatwick = Airport.new
munich = Airport.new
easyjet = Plane.new
gatwick.land(easyjet)
easyjet.flying?
munich.take_off(easyjet)
easyjet.flying?


#planes can only take off from airports they are in
