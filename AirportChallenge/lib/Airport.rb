

require_relative 'airplane'
require_relative "weather"
require_relative 'security'


class Airport
  include Weather
  include Security

  DEFAULT_CAPACITY = 10
  attr_reader :name, :airport_capacity, :cap_used, :planes_at_airport
  def initialize(airport)
    @name = airport
    @airport_capacity = DEFAULT_CAPACITY
    @cap_used = 0
    @planes_at_airport = []
  end


  def tell_to_land(plane)
    if stormy? == false && full? == false && security_threat? == false
      @cap_used += 1
      planes_at_airport << plane
      plane.plane_landed
      "#{plane} landed in #{@name} #{@planes_at_airport} is/are in the airport"
    else
      "#{@name} is full/dangerous or its too stormy, no land bro"
    end
  end

  def tell_to_take_off(plane)
    if stormy? == false && planes_at_airport.include?(plane) && security_threat == false
      @airport_capacity -= 1
      planes_at_airport.delete(plane)
      plane.plane_taken_off
      "#{plane} has taken off"
    elsif stormy?
      "too stormy to fly bro"
    else
      "plane not in airport"
    end
  end

  def assign_capacity(cap)
    airport_capacity = cap
    if cap_used > airport_capacity
      airport_capacity = 0
      "too many planes"
    else
      @airport_capacity = cap
    end
  end

  private

  def full?
    cap_used >= airport_capacity ? true : false
  end
end
