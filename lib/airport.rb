require_relative 'plane'

class Airport

  attr_reader :weather_state

  def take_off(plane)
    if @weather_state == "sunny"
      print "no longer in airport"
      @plane = nil
    else
      print "cannot take off as weather is currently #{@weather_state}"
    end

  end

  def sunny?
    number = rand(1..10)
    if number >= 6
      @weather_state = "sunny"
    else
      @weather_state = "stormy"
    end
  end

  def land(plane)
    @plane = plane
  end

  def full?
    false
  end

 def weather_override

    # loop do 
    #   puts "The weather today is #{@weather_state}"
    #   puts "Type 1 to update weather to sunny or 2 for stormy"
    #   input = gets.chomp!
    #   if input === "1"
    #     return "sunny"
    #   else
    #     return "stormy"
    #   end

    # end

  end

end