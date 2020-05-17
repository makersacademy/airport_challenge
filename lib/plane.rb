require_relative 'airport'

class Plane

  def initialize
    @location = "air"
  end

  def land_at(airport)
    if correct_location? && airport.landing_ok?(self)
      @location = airport
      puts "landed at #{airport}"
    elsif !correct_location?
      location_error_while("land")
    end
  end

  def takeoff_from(airport)
    if correct_location?(airport) && airport.takeoff_ok?(self)
      @location = "air"
      puts "departed #{airport}"
    elsif !correct_location?(airport)
      location_error_while("takeoff")
    end
  end

  private
  def correct_location?(location = "air")
    @location == location
  end

  def location_error_while(operation)
    puts "currently located at #{@location} so can not #{operation}"
  end
  
end
