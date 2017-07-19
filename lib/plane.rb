require_relative './safety'

class Plane
  include Safety
  attr_reader :name, :status

  def initialize(name)
    @name = name
    @status = 'airborne'
  end

  def land(airport, plane = self)
    if landing_safety_check(airport, plane) != "safety checks passed"
      landing_safety_check(airport, plane)
    elsif weather_check == "negative"
      "Landing aborted: Inclement weather"
    else
      airport.planes.push plane
      change_status
      "#{@name} has landed in #{airport.name}"
    end
  end

  def take_off(airport, plane = self)
    if take_off_safety_check(airport, plane) != "safety checks passed"
      take_off_safety_check(airport, plane)
    elsif weather_check == "negative"
      "Take Off aborted: Inclement weather"
    else
      airport.planes.delete plane
      change_status
      "#{@name} has taken off from #{airport.name}"
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
