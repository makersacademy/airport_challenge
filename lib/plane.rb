class Plane   # the class - is an object = noun in the user story
  def land   # instance method = verb in the user story
    @location = "airport"    # intance variable (its like a bucket - take/put information)
  end

  def location
    @location = "airport"
  end

  def capacity
    @capacity = 1
  end

  def no_landing
    @no_landing = "full"
  end

  def take_off
    @capacity = 0
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

# puts plane 
# plane_1 = Plane.new 
# plane_2 = Plane.new 

# plane_1.land   # this will show location as airport because i have given it the string 
# plane_1.location