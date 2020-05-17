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
      puts "currently located at #{@location} so can not land"
    end
  end

  def takeoff_from(airport)
    if correct_location?(airport) && airport.takeoff_ok?(self)
      @location = "air"
      puts "departed #{airport}"
    elsif !correct_location?(airport)
      puts "currently located at #{@location} so can not takeoff"
    end
  end

  private
  def correct_location?(location = "air")
    @location == location
  end

end
