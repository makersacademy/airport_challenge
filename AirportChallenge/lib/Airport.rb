

require 'airplane'
require "weather"
require 'security'


class Airport
  include Weather
  attr_reader :name, :airport_capacity, :cap_used, :planes_at_airport
  def initialize(airport)
    @name = airport
    @airport_capacity = 10
    @cap_used = 5
    @planes_at_airport = []
  end


  def tell_to_land(plane)
    if stormy? == false && full? == false
      @cap_used += 1
      planes_at_airport << plane
      plane.plane_landed
      "#{plane} landed in #{@name} #{@planes_at_airport} is/are in the airport"
    else
      "#{@name} is full or its too stormy, no land bro"
    end
  end

  def tell_to_take_off(plane)
    if stormy? == false && planes_at_airport.include?(plane)
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
