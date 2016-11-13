require_relative "weather"

class Airport
  attr_accessor :full_capacity

  def initialize
    @full_capacity = 20
  end

  def prevent_landing(capacity)
    if capacity > @full_capacity
      true
    else
      false
    end
  end

  def weather?
    Weather.new
  end
  
end
