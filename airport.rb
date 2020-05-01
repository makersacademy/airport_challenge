require_relative 'weather.rb'
require_relative 'plane.rb'

class Airport
  attr_accessor :total_capacity, :location

  def initialize(total_capacity=200, location)
    @total_capacity = total_capacity
    @location = location
    @plane_log = []
  end

  def check_weather
    weather_today = Weather.new
    return weather_today.stormy?
  end

  def invent_plane
    new_plane = Plane.new
    return new_plane.plane_id
  end

  def check_capacity
    @current_capacity = (@total_capacity - @plane_log.length)
    return @current_capacity
  end

  def plane_log_add(plane_id_number)
    @plane_log << plane_id_number
    return "This plane has landed at #{@location}."
  end

  def plane_log_delete(plane_id_number)
    @plane_log.delete(plane_id_number)
    @current_capacity = (@total_capacity - @plane_log.length)
  end

  def check_plane_log(plane_id_number)
    if @plane_log.length == 0
      return false
    else
      @plane_log.each { |x|
        if x == plane_id_number
          return true
        else
          return false
        end
        }
      end
  end

  def take_off(plane_id_number)
    if check_weather == true
      return "You cannot fly it is too stormy."
    else
      if check_plane_log(plane_id_number) == true
        plane_log_delete(plane_id_number)
        return "This plane number #{plane_id_number} has left #{@location} airport."
      else
        return "This plane is not in this airport, it cannot take off."
      end
    end
  end

  def land(plane_id_number)
    if check_weather == true
      return "You cannot land it is too stormy."
    else
      if check_capacity < 1
        return "#{@location} airport has #{@current_capacity} spaces left, your plane cannot land at this time."
      else
        return plane_log_add(plane_id_number)
      end
    end
  end
end
