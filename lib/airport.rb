require_relative 'weather'
require 'pry'

class Airport
  attr_accessor :count

  def initialize
    @count = 0
  end

  def land(weather)
    fail "The weather is stormy" if weather == "stormy"
    @count += 1
    "The plane has landed"
    end

    def take_off(weather)
      fail "The weather is stormy" if weather == "stormy"
      @count -= 1
      "The plane has taken off"
    end
end
