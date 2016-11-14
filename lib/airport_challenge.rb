
class Airport

  attr_reader :planes_landed, :planes_in_air, :weather

  def initialize
    @planes_landed = []
    @planes_in_air = []
    @weather = Weather.new
  end


  def land_plane(plane)
    puts "This plane has landed"
      @planes_landed << plane
    if @planes_in_air.include?(plane)
      @planes_in_air.delete(plane)
    end
  end

  def take_off(plane)
    puts "All clear for take off!"
    @planes_in_air << plane
    @planes_landed.pop
  end

  def confirm(plane)
    if @planes_in_air.include?(plane)
      puts "This plane is in flight"
    else
      puts "This plane is at the airport"
    end
  end

end

class Plane

end

class Weather

  attr_reader :forcast

  def initialize
    @forcast = forcast
  end


  def forcast
    weather = ["sunny", "sunny", "sunny", "fair", "sunny", "stormy", "sunny"]
    selector = weather.length
    random = rand(selector)
    weather_select = weather[random] + " "
    puts weather_select
  end

  def stromy?
    return true if @forcast == "stormy"
  end

end
