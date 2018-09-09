require_relative 'plane'

class Airport

attr_reader :store, :weather
attr_writer :store, :weather

  def initialize
    @store = []
    @weather = ["Sunny", "Stormy"] #remember to put in more values
  end


  def land_plane(plane)
    @store << plane
  end

  def take_off(plane)
      confirm(plane)
      @store.delete(plane)

    #  "#{plane} has taken off"
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
      return "Plane not safe"
    end
  end

  # def red_or_green_light(command)
  #   if command == "Go"
  #     take_off(plane)
  #   end

  #end


end
