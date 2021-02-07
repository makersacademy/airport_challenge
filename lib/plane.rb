require_relative 'airport'

class Plane
  attr_reader :in_flight

  def initialize
    @in_flight = false
    @plane = self
  end

  def at_capacity_warning
    raise "Airport hangar at full capacity"
  end

  def at_capacity?(airport)
    airport.hangar_full?
  end

  def stormy_weather_warning
    raise "Warning! Stormy weather"
  end

  def stormy?(airport)
    airport.weather == 'stormy'
  end

  def take_off_message(airport)
    puts "#{@plane} has successfully taken-off from #{airport}"
    # need to figure out how to passe local variable as instance var
  end

  def present?(airport)
    airport.hangar.include?(@plane)
  end

  def land(airport)
    if stormy?(airport)
      stormy_weather_warning
    elsif at_capacity?(airport)
      at_capacity_warning
    else
      airport.hangar << @plane
    end
  end

  def take_off(airport)
    if stormy?(airport)
      stormy_weather_warning
    else
      if present?(airport)
        airport.hangar.delete(@plane)
        take_off_message(airport)
      end
    end
  end
end
