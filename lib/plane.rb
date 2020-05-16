class Plane

  attr_reader :location

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
    @location = "air" if correct_location?(airport)
  end

  private
  def correct_location?(location = "air")
    @location == location
  end

end
