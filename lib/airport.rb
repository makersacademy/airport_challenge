require_relative "plane"

class Airport

  attr_accessor :capacity
  attr_reader :weather, :planes
  
  def initialize
  	@capacity = 6
    @planes = []
  end

  def permission_to_land plane
  	if stormy?
      fail 'Weather is stormy' 
    elsif reached_capacity?
      fail 'Permission denied'
# tried using "plane.land" to change status of
# each plane going into "planes" array to
# 'flying', but method was 'undefined' for plane?
# will come back to this... Works on irb?
  	else
      plane.land
      @planes << plane
    end
  end

  def permission_to_takeoff plane
    if stormy?
      fail "Weather is stormy"
    elsif empty?
      fail "Apologies, there are no planes here!"
    else
      plane.take_off
      @planes.pop
    end
  end

  def reached_capacity?
  	planes.length >= capacity
  end

  def empty?
    @planes = []
  end

  def weather
    %w('stormy' 'sunny').sample
  end

  def stormy?
    if weather == "stormy"
      return true
    else
      false
    end
  end

end
