class Airport

  attr_reader :capacity, :hangar, :weather
  DEFAULT_CAPACITY = 20
  
  def initialize(capacity = DEFAULT_CAPACITY)
   
    @capacity = capacity
    @hangar = []
    @weather = false
  end

  def stormy?
    weather
  end

  def weather_update(weather)
    @weather = weather
  end
end

class Plane

  attr_reader :location

  def initialize(airport = 'SKY')
    @location = [airport]
    if airport.is_a?(Airport)
      if airport.hangar.length < 20
        airport.hangar << self
      else
        raise "Airport full."
        @location = 'SKY'
      end
    end
  end

  def land(airport)

    if airport.hangar.length >= airport.capacity
      raise "Airport full."
  	elsif airport.stormy?
  	  raise "Too stormy to land."
  	elsif @location[0] != 'SKY'
  	  raise "Already at an airport."
    else
      airport.hangar << self
      @location = [] << airport
    end
  end

  def takeoff

    if !@location[0].is_a?(Airport)
      raise "Not in an airport."
  	elsif @location[0].stormy?
  	  raise "Too stormy to takeoff."
  	else
  	  @location[0].hangar.delete(self)
  	  @location = ['SKY']
    end
  end

  def takenoff?
    (location[0] = 'SKY') ? true : false
  end
end
