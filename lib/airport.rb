require_relative 'plane'

class Airport
  # def land(plane)
  # end

  def take_off(plane)
    @plane = nil
  end

  def sunny?
    arr = [true, true, false]
    @weather = arr.sample
  end

  def land(plane)
    @plane = plane
  end

  def full?
    false
  end

 def weather_override
  print "is it sunny? Type 'true' for sunny, 'false' for stormy"
  @weather = gets.chomp!
 end

end