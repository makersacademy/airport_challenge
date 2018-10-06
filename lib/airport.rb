require_relative 'weather'
require 'pry'

class Airport
  def count(planes)
    planes.count
  end

  def land(weather)
    fail "The weather is stormy" if weather == "stormy"
    "The plane has landed"
    end
    # binding.pry

    def take_off(weather)
      fail "The weather is stormy" if weather == "stormy"
      "The plane has taken off"
    end
end
