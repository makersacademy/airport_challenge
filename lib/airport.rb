require "./lib/plane.rb"

class Airport

  def initialize(name = "Heathrow", capacity = 10)
    @name = name
    @capacity = capacity
    @planesatairport = []
  end

  def allow_land(plane)
    raise "Cant land; NO capacity" unless @planesatairport.length < @capacity
    raise "Bad weather; no landing" unless set_weather == "sunny"
    plane.land(self)
    @planesatairport << plane
    true
  end

  def allow_takeoff(plane,destination)
    raise "The plane isnt here!" unless @planesatairport.include?(plane)
    raise "Bad weather; no takeoff" unless set_weather == "sunny"
    @planesatairport.delete(plane)
    plane.takeoff(destination)
    true
  end

  def get_traffic
    @planesatairport.length
  end

 def set_weather
   ["sunny","stormy"].sample
 end

end
