require_relative './safety'

class Plane
  include Safety
  attr_reader :name, :status

  def initialize(name)
    @name = name
    @status = 'airborne'
  end

  def land(airport, plane, weather)
    airport = airport
    plane = plane
    weather = weather
    if landing_safety_check(airport, plane, weather) == true
      airport.planes.push plane
      change_status
      "#{@name} has landed in #{airport.name}"
    else
      "Landing aborted"
    end
  end

  def take_off(airport, plane, weather)
    airport = airport
    plane = plane
    weather = weather
    if take_off_safety_check(airport, plane, weather) == true
      airport.planes.delete plane
      change_status
      "#{@name} has taken off from #{airport.name}"
    else
      "Take off not possible"
    end
  end

  private

  def change_status
    case
    when @status == 'airborne'
      @status = 'grounded'
    when @status == 'grounded'
      @status = 'airborne'
    end
  end

end
