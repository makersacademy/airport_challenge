require_relative "../lib/plane"

class Airport
  attr_accessor :planes, :default_capacity, :weather

  def initialize
    @planes = []
    @default_capacity = "50"
    @weather = "mild"
  end

  # def capacity(current_capacity)
  #   current_capacity = "50"
  # end

  def full_capacity(default_capacity)
    print "WARNING: Airport at full capcacity, plane cannot land"
    default_capacity = "100"
    # if current_capacity = "100"
    #   print "WARNING: Airport at full capcacity, plane cannot land"
    # end
  end

  def land(plane)
    print "Landing ..." + plane.to_s
    @planes.push(plane)
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  def no_landing_or_take_off
    print "WARNING: due to stormy weather no landing or take offs"
  end

  def stormy_weather
    @weather = "stormy"
    if @weather = "stormy"
      no_landing_or_take_off
    end
  end
end
