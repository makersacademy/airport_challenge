require_relative 'plane'

class Airport
  # def land(plane)
  # end

  def take_off(plane)
    @plane = nil
    print "no longer in airport"
  end

  def sunny?
    # arr = [true, true, false]
    # arr.sample

    number = rand(1..10)
    print number

    if number >= 6
      return true
    else
      return false
    end
  end

  def land(plane)
    @plane = plane
    
  end

  def full?
    false
  end

 def weather_override

    loop do 
      print "The weather today is #{sunny?}"
      print "Do you want to override? If so, type 1 for Sunny or 2 for Stormy"
      input = gets.chomp!
      if input === "1"
        return true
      else
        return false
      end

    end

  end

end