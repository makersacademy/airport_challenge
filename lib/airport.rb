require_relative "plane"
require_relative "weather"

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land plane
    fail "It's not safe to land." if safe? == false
    @planes << plane
  end

  def take_off plane
    fail "No planes in airport." if @planes.empty?
    fail "It's not safe to take off." if safe? == false
    @planes.delete(plane)
  end

  def safe?
    if Weather.new.new_day == "Stormy"
      return false
    else
      return true
    end
  end

end
