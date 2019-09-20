class Plane
attr_reader :space

  def initialize
    @airport_capacity = 1
  end

  def weather_conditions
    puts "is the weather stormy? type: y/n"
    weather = gets.chomp
    raise 'weather is too stormy to takeoff or land' if (weather == "y")
    if weather != "n"
      puts "answer not clear"
    end
  end

  def land(number_of_planes)
    weather_conditions
    raise 'airport is too full to land' if (@airport_capacity < number_of_planes)
    return "landed successfully"
  end

  def take_off
    weather_conditions
    return "left airport"
  end

end
