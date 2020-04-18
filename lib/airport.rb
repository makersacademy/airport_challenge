require_relative 'plane'

class Airport
  # def land(plane)
  # end

  def take_off(plane)
    @plane = nil
    print "no longer in airport"
  end

  def sunny?
    arr = [true, true, false]
    arr.sample
  end

  def land(plane)
    @plane = plane
  end

  def full?
    false
  end

 def weather_override
    print "is it sunny? Type sunny or stormy"
    input = gets.chomp!
    if input === "stormy"
      return false
    else
      return true
    end
  end

end