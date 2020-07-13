class Plane
  def weather
    weather = ['sunny', 'stormy']
    weather.sample
  end

  def land
    if weather == 'sunny'
      true
    else
      false
    end
  end

  def take_off
    if weather == 'sunny'
      true
    else
      false
    end
  end
end

class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  def initialize (capacity = DEFAULT_CAPACITY)
    @airport = []
    @capacity = capacity
  end

  def landing(plane)
    if plane.land == true && full? == false
      @airport << plane
    else
      fail 'Plane cannot land'
    end
  end

  def taking_off(plane)
    if plane.take_off == true
      @airport.delete(plane)
      @airport
    else
      fail 'Plane cannot take off'
    end
  end

  def full?
    if @airport.length >= @capacity
      true
    else
      false
    end
  end
end