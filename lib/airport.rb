require_relative 'plane'

class Airport

attr_reader :store, :weather
attr_writer :store, :weather

  def initialize
    @store = []
    @weather = ["Sunny", "Stormy", "Sunny", "Sunny"]
  end


  def land_plane(plane)
    @store << plane
  end

  def take_off(plane)
      confirm(plane)
      @store.delete(plane)
  end

  def confirm(plane)
     "plane has taken off"
  end

  def forecast
    @weather[rand(@weather.length)]
  end


  def is_it_safe(weather)
     return "Unsafe" if weather == "Stormy"
     return "Safe" if weather == "Sunny"
  end


  def go_or_stay(safety_status, plane)
    if safety_status == "Safe"
      take_off(plane)
    elsif safety_status == "Unsafe"
      return "Takeoff not safe"
    end
  end

  def land_or_not(safety_status, plane)
    if safety_status == "Safe"
      land_plane(plane)
    elsif safety_status == "Unsafe"
      return "Landing not safe"
    end
  end

end
