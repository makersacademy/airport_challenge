require "./lib/plane.rb"

class Airport

  def initialize(name = "Heathrow", capacity = 10)
    @name = name
    @capacity = capacity
    @planesatairport = []
  end

  def allowland(plane)
    raise "Cant land; NO capacity" unless @planesatairport.length < @capacity
    raise "Bad weather; no landing" unless setweather == "sunny"
    plane.land(self)
    @planesatairport << plane
    true
  end

  def allowtakeoff(plane,destination)
    raise "The plane isnt here!" unless @planesatairport.include?(plane)
    raise "Bad weather; no takeoff" unless setweather == "sunny"
    @planesatairport.delete(plane)
    plane.takeoff(destination)
    true
  end

  def gettraffic
    @planesatairport.length
  end

 def setweather
   ["sunny","stormy"].sample
 end

end
