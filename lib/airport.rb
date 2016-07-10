require_relative "plane"

class Airport

  #def accept(plane)
  #  Plane.new
  #end

  def weather_stormy?
    #The weather generator: it will return true 10% of the time
    rand(101) <= 10
  end

  def deny_takeoff
    'The weather is stormy, takeoff denied' if weather_stormy?
  end

  def deny_landing
    'The weather is stormy, landing denied' if weather_stormy?
  end

end
