class Plane   
  def land   
    @location = "airport"    
  end

  def location
    @location #questions dont need assignment 
  end

  def take_off
    @location = "in_the_air"
  end

  def capacity
    @capacity = 1
  end

  def no_landing
    @no_landing = "full"
  end

  def storm
    @information = "no_take_off"
  end 

  def stormy_weather
    @storm = "no_landing"
  end

  def fly
    @capacity = 0
  end
end
