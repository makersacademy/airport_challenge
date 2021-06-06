class Airport

  attr_reader :hangar

  def initialize(hangar_cap = 2)
    @hangar = []
    @hangar_cap = hangar_cap
  end

  def land_plane(plane)
    raise "No space in hangar" unless @hangar.length < @hangar_cap
    @hangar << plane unless @hangar.include?(plane)
  end

  def take_off(plane, weather)

    raise "You can't take off" unless weather == "sunny"

    @hangar.delete(plane)
    @hangar.empty? ? "No planes in hangar" : "Planes in hangar: #{hangar.length}"
  
  end

end

class Plane
  def working?
    true
  end
end

class Weather
  attr_reader :weather

  def working?
    true
  end

  def forecast
    @weather = ["sunny", "sunny", "sunny", "sunny", "stormy"].sample
    puts @weather
  end

end