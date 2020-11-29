require './lib/airport.rb'
require './lib/plane.rb'
class Air_traffic_controller
  def take_off(airport, plane)
    if airport.get_weather == :sunny && plane.is_flying == false
      if are_same_locations(plane.location, airport.location) == true
        return true
        else 
          raise RuntimeError.new('Location must be wrong')
        end
    else 
      if airport.get_weather == :stormy
        raise RuntimeError.new("The plane cannot take_off because of the stormy weather")
        elsif plane.is_flying == true
          raise RuntimeError.new("The plane is already flying")
      end
    end
  end

  def are_same_locations(location_a, location_b)
    if location_a == location_b
      return true
    else 
      return false
    end
  end
 
  def land(airport, plane)
    if airport.get_weather == :sunny && airport.is_full == false
      if are_same_locations(plane.location, airport.location) == true
        raise RuntimeError.new('Location must be wrong')
      else 
        return true
      end
    else 
      if airport.get_weather == :stormy
        raise RuntimeError.new("The plane cannot land because of the stormy weather")
      elsif airport.is_full == true 
        raise RuntimeError.new("The airport is full")
      end
    end

  end
  end
  