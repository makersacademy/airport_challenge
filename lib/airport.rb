require_relative 'plane'

class Airport
  # def land(plane)
  # end

  def take_off(plane)
    @plane = nil
    print "no longer in airport" if sunny? == "sunny"
  end

  def sunny?
    # arr = [true, true, false]
    # arr.sample

    number = rand(1..10)
    print number

    if number >= 6
      return "sunny"
    else
      return "stormy"
    end
  end

  def land(plane)
    @plane = plane
  end

  def full?
    false
  end

 def weather_override_sunny?

    loop do 
      puts "The weather today is #{sunny?}"
      puts "Do you want to override? If so, type 1 for Sunny or 2 for Stormy"
      input = gets.chomp!
      if input === "1"
        return "sunny"
      else
        return "stormy"
      end

    end

  end

end