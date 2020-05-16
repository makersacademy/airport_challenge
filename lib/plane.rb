require_relative 'airport'

class Plane

  def initialize
    @location = "air"
  end

  def land_at(airport)
    if correct_location?
      @location = airport
      puts "landed at #{airport}"
    else
      puts "currently located at #{@location} so can not land"
    end
  end

  def takeoff_from(airport)
    if correct_location?(airport)
      @location = "air"
      puts "departed #{airport}"
    else
      puts "currently located at #{@location} so can not takeoff"
    end
  end

  private
  def correct_location?(location = "air")
    @location == location
  end

end
